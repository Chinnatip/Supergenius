class Course < ApplicationRecord

  # Course has_many time_table
  before_save do
    self.time_table.gsub!(/[\[\]\"]/, "") if attribute_present?("time_table")
  end

  def self.count_all
    return self.all.count
  end

  def self.parse_grade(key)
    case key
    when 1 then return "ป.1"
    when 2 then return "ป.2"
    when 3 then return "ป.3"
    when 4 then return "ป.4"
    when 5 then return "ป.5"
    when 6 then return "ป.6"
    when 7 then return "ม.1"
    when 8 then return "ม.2"
    when 9 then return "ม.3"
    when 10 then return "ม.4"
    when 11 then return "ม.5"
    when 12 then return "ม.6"
    end
  end

  def self.parse_major(key)
    case key
    when "ENG" then return "ภาษาอังกฤษ"
    when "THA" then return "ภาษาไทย"
    when "SCI" then return "วิทย์"
    when "SCIGIFT" then return "วิทย์ GIFTED"
    when "SOC" then return "สังคม"
    when "SKI" then return "ทักษะ"
    when "MAT" then return "เลข"
    when "MATGIFT" then return "เลข GIFTED"
    when "PHY" then return "ฟิสิกส์"
    when "CHE" then return "เคมี"
    when "BIO" then return "ชีวะ"
    else return "ไม่มีหมวด"
    end
  end

  def self.collect_student(key)
    result = 0
    class_list = Classroom.where(course: key)
    class_list.each do |c|
      result += Seat.find_student(c[:spec])
    end
    return result
  end

  def self.time_table_abbrev(dates)
    result = ""
    date_set = [
      {d: 'จ', v: 1},
      {d: 'อ', v: 2},
      {d: 'พ', v: 3},
      {d: 'พฤ', v: 4},
      {d: 'ศ', v: 5},
      {d: 'ส', v: 6},
      {d: 'อา', v: 7}
    ]
    if dates.present?
      range = dates.split(",")
      range.each_with_index do |d,idx|
        get    = date_set.select { |hash| hash[:v] == d.to_i }
        prefix = if idx > 0 then "," end
        result += "#{prefix}#{get[0][:d]}"
      end
    else
      result = '-'
    end
    return result
  end

  def self.details(obj)
    return {
      id:         "#{"%04d" % obj[:id]}" ,
      name:       obj[:name] ,
      semester:   Semester.where(sem_code: obj[:semester]).first[:name] ,
      major:      parse_major(obj[:major]) ,
      grade:      parse_grade(obj[:grade]) ,
      price:      if obj[:price].present? then "#{obj[:price].floor} บาท" else '-' end ,
      seat:       "#{collect_student(obj[:id])} คน",
      range:      "#{obj[:start].strftime('%d %b')} - #{obj[:end].strftime('%d %b %y')}",
      time:       "#{obj[:start_time].strftime('%H:%M')}-#{obj[:end_time].strftime('%H:%M')}",
      period:     "#{obj[:period]} ครั้ง" ,
      time_table: time_table_abbrev(obj[:time_table])
    }
  end
end
