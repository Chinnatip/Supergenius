class ReportController < ApplicationController
  layout "report"
  # layout 'dashboard'
  before_action :get_year_lists

  def show
    result = []
    @classroom = Classroom.find(params[:id])
    @classroom_detail = Classroom.details(@classroom)
    @seats          = Seat.where(classroom: params[:id])
    @seat_sort      = sortable_seat(@seats, 'total_score')
    @select_options = ["","-","0","1","2","3","4","5","6","7","8","9","10"]
    course_period   = Course.find(@classroom.course).period
    @toggle_max_score = JSON.parse(@classroom[:max_score]) rescue nil
    @max_score      = (@toggle_max_score.sort_by { |k,v| k.to_f }).to_h rescue  sampling_score(Array.new( course_period , 10))
    @current_period = Classroom.find(params[:id])[:current] || "1"
  end

  def parse_birthdate_string(txt)
    parse = txt.split("-")
    return "#{'%02d' % parse[0]}#{'%02d' % parse[1]}"
  end

  def check_student_trigger
    puts params.inspect
    if params[:student_code].present? && params[:birthval].present?
      student = Student.where(student_code: params[:student_code])
      if student.count > 0
        @student = student.first
        @birth   = @student.birthday.present? ? parse_birthdate_string(@student.birthday) : "0000"
        if params[:birthval] == @birth
          # redirect_to report_index_path(code: "OK_YOUR_CODE_WAS_CORRECT!")
          redirect_to report_student_path(id: @student.id)
        else
          redirect_to report_index_path(valid: false)
        end
      else
        redirect_to report_index_path(valid: false)
      end
    else
      redirect_to report_index_path(valid: false)
    end
  end

  def student
    puts '0>'
    if params[:id].present?
      puts '1>'
      student  = Student.find(params[:id])
      puts '2>'
      @student = {
        name:         "#{student[:name]} #{student[:surname]}",
        nickname:     student[:nickname],
        gender:       Student.parser_gender(student[:gender]),
        parent_name:  (student[:parent] || '-'),
        grade:        Student.parse_grade(student[:grade]),
        school:       Student.parse_school(Student.current_school(student)),
        phone:        "#{student[:tel]},#{student[:tel_parent]}",
        secret:       student[:secret_id],
        birthday:     student[:birthday]
      }
      @seat = []
      puts '3>'
      student_code = student.student_code
      #
      # Current semester registered-course
      # register = Register.where(student: student_code).pluck(:course)
      puts '4>'
      # @current_semester = @set_current_semester || "20261"
      # register = []
      puts '5>'
      # Register.where(student: student_code).each do |res|
      #   meid = res.course
      #   selected_course = Course.where(id).first
      #   if selected_course != nil && selected_course[:semester] == @current_semester
      #     register << id
      #   end
      # end
      #
      puts '6>'
      seat  = Seat.where(student: student_code)
      @register_class  = Classroom.where(id: seat.pluck(:classroom))
      @register_course = Course.find(@register_class.pluck(:course).uniq)
      puts '7>'
      seat.each do |st|
        #
        if Classroom.where(id: st[:classroom]).count > 0
          puts '8>'
          classroom = Classroom.find(st[:classroom])
          score_point = Exam.where(student: student_code, classroom: classroom.id,exam_type: "scoring").first.score rescue "{\"0\":\"0\"}"
          score_range = Exam.where(classroom: classroom.id,exam_type: "scoring").pluck(:score)
          puts '9>'
          # classroom was learned >
          if score_range.count > 0
            # puts "get score container >>"
            score_container = []
            puts '10>'
            score_range.each do |sm|
              content = JSON.parse(sm).select {|k, v| !(v == '') && !(v == '-') }
              score_container << content
              # score_container << JSON.parse(sm)
            end
            # score point
            score_get = JSON.parse(score_point)
            puts '11>'
            # process score
            score_result = {}
            point_get = []
            max_get   = []
            min_get   = []
            draft_get = []
            puts '12>'
            score_setter = JSON.parse(classroom.max_score).keys
            score_setter.each do |st|
              puts '13>'
              #
              score_result[st.to_sym] = {
                max: score_container.max_by{|k| k[st].to_i }[st] || 0,
                min: score_container.min_by{|k| k[st].to_i }[st] || 0,
                get: score_get[st].to_i || 0,
                draft: score_get[st] || "X"
              }
              puts '14>'
              point_get << score_result[st.to_sym][:get]
              max_get   << score_result[st.to_sym][:max]
              min_get   << score_result[st.to_sym][:min]
              draft_get << score_result[st.to_sym][:draft]
            end
            puts '15>'
            mental_point = Exam.where(student: student_code, classroom: classroom.id,exam_type: "mental").first.score rescue "{\"0\":\"0\"}"
            @seat << {
              id:           st[:id],
              classroom:    classroom.name,
              session:      JSON.parse(classroom.max_score),
              score_point:  point_get,
              max_point:    max_get,
              min_point:    min_get,
              draft_point:  draft_get,
              mental_point: JSON.parse(mental_point)
            }
          end
        end
      end
      # @classroom = Classroom.find(seat.pluck(:classroom))
    else
      redirect_to :back
    end
  end

  def sortable_seat(seat,sort_param)
    if sort_param == 'total_score'
      return seat.sort_by{ |s| find_score(@classroom.id, s[:student]).values.map { |m| m.to_i rescue 0 }.reduce(:+) }.reverse
    elsif sort_param == 'current_score'
      return seat.sort_by{ |s| find_score(@classroom.id, s[:student])[@current_period].to_i rescue 0 }.reverse
    else
      return seat.sort_by{ |s| s[:student] }.sort_by { |s| s[:comment].to_s }
    end
  end

  def find_score(classroom,student)
    exam  = Exam.where(classroom: classroom , student: student ,exam_type: 'scoring').first
    score = exam['score'] rescue "{\"0\":\"0\"}"
    return JSON.parse(score)
  end

  def sampling_score(array)
    result = {}
    array.each_with_index do |val,i|
      key = (i + 1).to_s
      result[key] = val.to_s
    end
    puts "res >>>"
    puts result
    puts result.to_json
    return result
  end

  def index
    valid_semester  = Course.pluck(:semester)
    @semester_lists = Semester.where(year: @current_year.to_s , sem_code: valid_semester)
    @courses = Course.all
    @classrooms = Classroom.all
    rooms = Classroom.all
    grader = [
      {key: 'P1', classroom: [] , val: 'ประถมศึกษาปีที่ 1'},
      {key: 'P2', classroom: [] , val: 'ประถมศึกษาปีที่ 2'},
      {key: 'P3', classroom: [] , val: 'ประถมศึกษาปีที่ 3'},
      {key: 'P4', classroom: [] , val: 'ประถมศึกษาปีที่ 4'},
      {key: 'P5', classroom: [] , val: 'ประถมศึกษาปีที่ 5'},
      {key: 'P6', classroom: [] , val: 'ประถมศึกษาปีที่ 6'},
      {key: 'M1', classroom: [] , val: 'มัธยมศึกษาปีที่ 1'},
      {key: 'M2', classroom: [] , val: 'มัธยมศึกษาปีที่ 2'},
      {key: 'M3', classroom: [] , val: 'มัธยมศึกษาปีที่ 3'},
      {key: 'M4', classroom: [] , val: 'มัธยมศึกษาปีที่ 4'},
      {key: 'M5', classroom: [] , val: 'มัธยมศึกษาปีที่ 5'},
      {key: 'M6', classroom: [] , val: 'มัธยมศึกษาปีที่ 6'}
    ]
    grader.each_with_index do |g,i|
      rooms.each do |r|
        if r[:spec][5..6] == g[:key]
          g[:classroom] << {
            spec: r[:spec],
            name: r[:name] ,
            old_link: r[:old_link] ,
            student: Classroom.parse_seat(r[:spec]) ,
            teacher: Classroom.parse_teacher(r[:teacher]) ,
            period: r[:period]
          }
        end
      end
    end
    @class_index = grader
  end

  private
  def get_year_lists
    @year_lists = Semester.pluck(:year).uniq.sort { |x,y| y <=> x }
    @current_year = params[:select_year] || @set_current_year #2560 #DateTime.now.strftime('%Y').to_i + 543
  end
end
