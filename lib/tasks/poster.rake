require 'rake'

School.where(name: 'โรงเรียนบีคอนเฮาส์แย้มสอาดรังสิต').first[:id]


task :post_new_student => :environment do
  puts "create student template >>>"
  students = [
    {nickname: 'ดรีม',school: 'โรงเรียนบ้านพลอย',tel_student:'-',tel_parent:'089-172-9445',name:'ดรีม',surname:'เจริญทรัพย์',gender: 'm',birth:'9-9-2010',grade: '1'},
    {nickname: 'พู่กัน',school: 'โรงเรียนบีคอนเฮาส์แย้มสอาดรังสิต',tel_student:'-',tel_parent:'-',name:'ทิตญาพร',surname:'อาจารีย์',gender: 'f',birth:'11-8-2010',grade: '1'},
    {nickname: 'กัปตัน',school: 'โรงเรียนธัญวิทย์',tel_student:'-',tel_parent:'089-754-6610',name:'อนทพัทย์',surname:'จินดาพรรณ',gender: 'm',birth:'12-4-2010',grade: '2'},
    {nickname: 'แพรวา',school: 'โรงเรียนเซนต์ฟรังซีสเซเวียร์',tel_student:'093-630-8258',tel_parent:'081-748-8577',name:'ปัณฑิตา',surname:'สิงหพันธ์',gender: 'f',birth:'29-6-2010',grade: '2'},
    {nickname: 'พลอยขวัญ',school: 'โรงเรียนธัญวิทย์',tel_student:'-',tel_parent:'086-368-0243',name:'สิณฆ์สินี',surname:'เฉลิมศรี',gender: 'f',birth:'9-9-2009',grade: '2'},
    {nickname: 'หลิน',school: 'โรงเรียนสาธิตแห่งมหาวิทยาลัยรังสิต',tel_student:'-',tel_parent:'086-909-6745',name:'พิชชา',surname:'เจริญลาภนพรัตน์',gender: 'f',birth:'28-5-2010',grade: '2'},
    {nickname: 'สตางค์',school: 'โรงเรียนเซนต์โยเซฟเมืองเอก',tel_student:'091-768-3150',tel_parent:'087-028-4747',name:'นันท์นภัสร์',surname:'สุขสุวรรณ์',gender: 'f',birth:'14-9-2009',grade: '2'},
    {nickname: 'นาย',school: 'โรงเรียนรังสฤษฎิ์สองภาษา',tel_student:'-',tel_parent:'085-323-6742',name:'ณัฐกิตต์',surname:'พ่วงนาราม',gender: 'm',birth:'2-10-2009',grade: '2'},
    {nickname: 'อีสเตอร์',school: 'โรงเรียนเซนต์ฟรังซีสเซเวียร์',tel_student:'-',tel_parent:'094-993-3995',name:'ลัชกร',surname:'ศิลาเกษ',gender: 'm',birth:'9-3-2009',grade: '3'},
    {nickname: 'ซาลาดิน',school: 'โรงเรียนธัญวิทย์',tel_student:'-',tel_parent:'081-822-2681',name:'วริศ',surname:'พงษ์ชัยศรี',gender: 'm',birth:'3-10-2008',grade: '3'},
    {nickname: 'ปั้น',school: 'โรงเรียนธัญวิทย์',tel_student:'-',tel_parent:'083-135-4499',name:'วสุสรรณชัย',surname:'โพธิ์ทอง',gender: 'm',birth:'10-11-2008',grade: '3'},
    {nickname: 'พิ้งค์',school: 'โรงเรียนโชคชัยรังสิต',tel_student:'-',tel_parent:'086-377-4542',name:'ชมพูนุช',surname:'วิริยะพงศ์ไพบูลย์',gender: 'f',birth:'26-9-2008',grade: '3'},
    {nickname: 'วี',school: 'โรงเรียนเซนต์โยเซฟเมืองเอก',tel_student:'086-992-0411',tel_parent:'089-104-6869',name:'วีรวิทย์',surname:'ปาณิกวงษ์',gender: 'm',birth:'22-4-2009',grade: '3'},
    {nickname: 'ภูมิ',school: 'โรงเรียนโชคชัยรังสิต',tel_student:'-',tel_parent:'094-223-9296',name:'ณัฐชนนท์',surname:'สุดรอด',gender: 'm',birth:'26-1-2009',grade: '3'},
    {nickname: 'ภีม',school: 'โรงเรียนโชคชัยรังสิต',tel_student:'-',tel_parent:'094-223-9296',name:'ณัฐชนันท์',surname:'สุดรอด',gender: 'm',birth:'26-1-2009',grade: '3'},
    {nickname: 'เพ้นท์',school: 'โรงเรียนบีคอนเฮาส์แย้มสอาดรังสิต',tel_student:'-',tel_parent:'062-885-5444',name:'ธีรภัทร',surname:'อาจารีย์',gender: 'm',birth:'28-10-2008',grade: '3'},
    {nickname: 'สิงโต',school: 'โรงเรียนสารสาสน์วิเทศราชพฤกษ์',tel_student:'-',tel_parent:'081-805-6709',name:'ศุภกร',surname:'อัมระรงค์',gender: 'm',birth:'29-7-2008',grade: '3'},
    {nickname: 'ก้านพลู',school: 'โรงเรียนโชคชัยรังสิต',tel_student:'094-298-4694',tel_parent:'085-133-3535',name:'สุพิชฌาย์',surname:'วัตตะสาระ',gender: 'f',birth:'14-2-2008',grade: '3'},
    {nickname: 'ชาร์ป',school: 'โรงเรียนสาธิตแห่งมหาวิทยาลัยรังสิต',tel_student:'-',tel_parent:'081-780-0671',name:'สุพศิริ',surname:'เตียรัตนคุณ',gender: 'f',birth:'12-1-2008',grade: '3'},
    {nickname: 'นนนี่',school: 'โรงเรียนสารสาสน์วิเทศรังสิต',tel_student:'092-968-5153',tel_parent:'086-144-1466',name:'สมิตา',surname:'โชติกเสถียร',gender: 'f',birth:'20-8-2008',grade: '3'},
    {nickname: 'นันท์',school: 'โรงเรียนโชคชัยรังสิต',tel_student:'082-323-1177',tel_parent:'084-139-3399',name:'นันท์ณัศกรณ์',surname:'ทวีทรัพย์มณี',gender: '-',birth:'5-11-2007',grade: '4'},
    {nickname: 'จินนี่',school: 'โรงเรียนธัญวิทย์',tel_student:'065-724-4484',tel_parent:'083-610-0773',name:'ขวัญชนก',surname:'จึงสุระ',gender: 'f',birth:'4-8-2008',grade: '4'},
    {nickname: 'เล้ง',school: 'โรงเรียนบ้านพลอย',tel_student:'-',tel_parent:'086-306-2638',name:'ภูมิรพี',surname:'พันธุเมฆินทร์',gender: '-',birth:'21-10-2008',grade: '4'},
    {nickname: 'ฟู่',school: 'โรงเรียนธัญวิทย์',tel_student:'-',tel_parent:'089-773-9500',name:'พงสกรณ์',surname:'ศักดิ์สวัสดิ์',gender: 'm',birth:'7-2-2008',grade: '4'},
    {nickname: 'อ้อ',school: 'โรงเรียนธัญวิทย์',tel_student:'-',tel_parent:'081-423-3060',name:'จิตตานันท์',surname:'อรชุน',gender: 'f',birth:'9-5-2008',grade: '4'},
    {nickname: 'อ้อม',school: 'โรงเรียนธัญวิทย์',tel_student:'-',tel_parent:'081-423-3060',name:'ชนันท์กานต์',surname:'อรชุน',gender: 'f',birth:'9-5-2008',grade: '4'},
    {nickname: 'โชกุล',school: 'โรงเรียนธัญวิทย์',tel_student:'-',tel_parent:'081-830-2270',name:'โชกุล',surname:'งามเสถียร',gender: 'm',birth:'9-9-2007',grade: '4'},
    {nickname: 'ยิม',school: 'โรงเรียนอัมพรไพศาล',tel_student:'-',tel_parent:'089-200-1677',name:'พิมพ์บุญญา',surname:'วาณิชวทัญญู',gender: 'f',birth:'22-11-2007',grade: '4'},
    {nickname: 'ธฌา',school: 'โรงเรียนธัญวิทย์',tel_student:'-',tel_parent:'086-904-0464',name:'ทรธภร',surname:'พาหาสิงห์',gender: 'f',birth:'14-5-2008',grade: '4'},
    {nickname: 'แพม',school: 'โรงเรียนโชคชัยรังสิต',tel_student:'090-956-9667',tel_parent:'081-259-8836',name:'กัลยรัตน์',surname:'นาคาบดี',gender: 'f',birth:'29-10-2007',grade: '4'},
    {nickname: 'ภูพา',school: 'โรงเรียนเซนต์ฟรังซีสเซเวียร์',tel_student:'093-630-8258',tel_parent:'081-748-8577',name:'ปุณณกันต์',surname:'สิงห์พันธ์',gender: 'm',birth:'12-4-2008',grade: '4'},
    {nickname: 'โซแปง',school: 'โรงเรียนเซนต์ฟรังซีสเซเวียร์',tel_student:'-',tel_parent:'087-704-1211',name:'พิชญ์สินี',surname:'จิตเพราเพริด',gender: 'f',birth:'7-7-2008',grade: '4'},
    {nickname: 'เคน',school: 'โรงเรียนไผทอุดมศึกษา',tel_student:'-',tel_parent:'081-644-8731',name:'ญนภัทร์',surname:'นิตย์วิชญ์กร',gender: 'm',birth:'16-9-2008',grade: '4'},
    {nickname: 'สมาร์ท',school: 'โรงเรียนเซนต์โยเซฟเมืองเอก',tel_student:'097-220-6814',tel_parent:'089-202-4686',name:'ชณันธร',surname:'บุญแก้วปอม',gender: 'm',birth:'6-1-2008',grade: '4'},
    {nickname: 'ปุณณ์',school: 'โรงเรียนพระหฤทัยนนทบุรี',tel_student:'-',tel_parent:'083-960-6316',name:'ปุณณาวิชญ์',surname:'สุวรรณธนรักษ์',gender: 'm',birth:'10-1-2008',grade: '4'},
    {nickname: 'เกรซ',school: 'โรงเรียนไผทอุดมศึกษา',tel_student:'081-392-9103',tel_parent:'081-637-7879',name:'กฤตพร',surname:'วรมณีจินดา',gender: 'f',birth:'2-7-2007',grade: '5'},
    {nickname: 'ณัช',school: 'โรงเรียนโชคชัยรังสิต',tel_student:'089-693-6217',tel_parent:'089-115-1303',name:'ณัชพงษ์',surname:'อาชววาณิชกุล',gender: 'm',birth:'18-6-2007',grade: '5'},
    {nickname: 'อีฟ',school: 'โรงเรียนสารสาสน์วิเทศรังสิต',tel_student:'-',tel_parent:'089-977-0626',name:'มนต์ศิชา',surname:'ม่วงศรีจันทร์',gender: '-',birth:'15-5-2007',grade: '5'},
    {nickname: 'ยูกิ',school: 'โรงเรียนฤทธิยะวรรณาลัย',tel_student:'090-927-6688',tel_parent:'087-906-7169',name:'ภูวสิษฏ์',surname:'',gender: '-',birth:'12-10-2006',grade: '5'},
    {nickname: 'ภูมิ',school: 'โรงเรียนเซนต์โยเซฟเมืองเอก',tel_student:'061-427-3784',tel_parent:'089-814-1408',name:'ภูมิพงศ์',surname:'ศรีสุวรรณ์',gender: 'm',birth:'30-11-2006',grade: '5'},
    {nickname: 'ออมสิน',school: 'โรงเรียนรังสิตวิทยา',tel_student:'097-249-4631',tel_parent:'083-619-3331',name:'ณศมน',surname:'พรพรหม',gender: 'f',birth:'8-1-2007',grade: '5'},
    {nickname: 'ปราย',school: 'โรงเรียนเซนต์โยเซฟเมืองเอก',tel_student:'093-245-1594',tel_parent:'099-149-2615',name:'ธีร์วรา',surname:'ฐิติเรืองเกียรติ',gender: 'f',birth:'13-3-2007',grade: '5'},
    {nickname: 'ไอ',school: 'โรงเรียนเซนต์โยเซฟเมืองเอก',tel_student:'-',tel_parent:'081-928-1145',name:'ณิชากร',surname:'สมิตเวช',gender: 'f',birth:'1-3-2007',grade: '5'},
    {nickname: 'ใหม่',school: 'โรงเรียนธัญวิทย์',tel_student:'097-280-7641',tel_parent:'086-570-4631',name:'ศุภกฤต',surname:'วัฒนพิสิษฐ์',gender: 'm',birth:'28-12-2006',grade: '5'},
    {nickname: 'ออมสิน',school: 'โรงเรียนธัญวิทย์',tel_student:'-',tel_parent:'081-694-6210',name:'กันตพงษ์',surname:'อิทรพงษ์',gender: 'm',birth:'16-3-2007',grade: '5'},
    {nickname: 'เอย',school: 'โรงเรียนรัตนโกสินทร์-รังสิต',tel_student:'-',tel_parent:'097-061-3067',name:'อรญา',surname:'ผ่องศรี',gender: 'f',birth:'9-1-2006',grade: '5'},
    {nickname: 'หยก',school: 'โรงเรียนอัมพรไพศาล',tel_student:'-',tel_parent:'089-200-1677',name:'พิมพ์มาต',surname:'วาณิชวทัญญู',gender: 'f',birth:'2-2-2006',grade: '5'},
    {nickname: 'นีโอ',school: 'โรงเรียนโชคชัยรังสิต',tel_student:'098-895-2515',tel_parent:'089-810-3080',name:'อิชรวิน',surname:'อุยทังคำ',gender: 'm',birth:'22-8-2006',grade: '5'},
    {nickname: 'แม็ค',school: 'โรงเรียนธัญวิทย์',tel_student:'-',tel_parent:'089-772-2367',name:'ไกรวิชญ์',surname:'เกียริเมชา',gender: 'm',birth:'28-9-2006',grade: '5'},
    {nickname: 'ซินวา',school: 'โรงเรียนธัญวิทย์',tel_student:'-',tel_parent:'081-449-9490',name:'ฐิติวรดา',surname:'สิริเธียรไชย',gender: 'f',birth:'4-2-2007',grade: '5'},
    {nickname: 'คอปเตอร์',school: 'โรงเรียนบ้านพลอย',tel_student:'-',tel_parent:'099-142-8282',name:'เทพทัต',surname:'พงศ์คำ',gender: 'm',birth:'8-6-2007',grade: '5'},
    {nickname: 'ออสติน',school: 'โรงเรียนเซนต์ฟรังซีสเซเวียร์',tel_student:'-',tel_parent:'094-993-3995',name:'ธนภัทร',surname:'ศิลาเทช',gender: 'm',birth:'25-9-2006',grade: '5'},
    {nickname: 'โฟโต้',school: 'โรงเรียนธัญวิทย์',tel_student:'062-249-5880',tel_parent:'088-941-9663',name:'อัทรวัฒน์',surname:'กุลศิรวัฒน์',gender: 'm',birth:'4-10-2006',grade: '5'},
    {nickname: 'น้ำอิง',school: 'โรงเรียนธัญวิทย์',tel_student:'086-990-1588',tel_parent:'091-545-5382',name:'ชนินาก',surname:'เฟื่องจันทร์',gender: 'f',birth:'24-11-2006',grade: '5'},
    {nickname: 'ขิงขิง',school: 'โรงเรียนธัญวิทย์',tel_student:'081-968-6835',tel_parent:'081-341-6868',name:'ภัทรานิษฐ์',surname:'เพชรปานกัน',gender: 'f',birth:'9-8-2006',grade: '5'},
    {nickname: 'เป็นต่อ',school: 'โรงเรียนธัญวิทย์',tel_student:'-',tel_parent:'081-988-1198',name:'เป็นต่อ',surname:'เครือทองศรี',gender: 'm',birth:'12-1-2007',grade: '5'},
    {nickname: 'เพลง',school: 'โรงเรียนธัญวิทย์',tel_student:'095-661-9693',tel_parent:'095-909-2555',name:'ณภาภัช',surname:'ภิรมย์',gender: 'f',birth:'15-3-2007',grade: '5'},
    {nickname: 'ขวัญข้าว',school: 'โรงเรียนเซนต์โยเซฟเมืองเอก',tel_student:'091-806-6116',tel_parent:'095-469-6166',name:'',surname:'',gender: '-',birth:'',grade: '5'},
    {nickname: 'จันทร์หอม',school: 'โรงเรียนธัญวิทย์',tel_student:'064-103-9587',tel_parent:'086-368-0243',name:'สุภัชญา',surname:'เฉลิมศิริ',gender: 'f',birth:'17-11-2006',grade: '5'},
    {nickname: 'เพชร',school: 'โรงเรียนธัญวิทย์',tel_student:'-',tel_parent:'087-683-3448',name:'วชิรวิทย์',surname:'ทองพิลา',gender: 'm',birth:'24-4-2007',grade: '5'},
    {nickname: 'กาย',school: 'โรงเรียนธัญวิทย์',tel_student:'098-848-8172',tel_parent:'086-615-7711',name:'บุณวัสส์',surname:'เทพคุ้มกัน',gender: 'm',birth:'23-9-2006',grade: '5'},
    {nickname: 'มินนี่',school: 'โรงเรียนธัญวิทย์',tel_student:'097-238-5332',tel_parent:'086-527-4601',name:'สุพิชชา',surname:'สุขสุวรรณ์',gender: 'f',birth:'14-6-2007',grade: '5'},
    {nickname: 'ภูริ',school: 'โรงเรียนไตรราชวิทยา',tel_student:'063-451-4953',tel_parent:'081-8114587',name:'ภูริ',surname:'เปล่งผึ่ง',gender: 'm',birth:'9-9-2004',grade: '6'},
    {nickname: 'เจมส์',school: 'โรงเรียนธัญวิทย์',tel_student:'095-001-1536',tel_parent:'085-047-6305',name:'กิตติพัฒน์',surname:'จิรวัฒน์พิทักษ์',gender: 'm',birth:'31-3-2006',grade: '6'},
    {nickname: 'มายด์',school: 'โรงเรียนอัมพรไพศาล',tel_student:'091-064-1778',tel_parent:'',name:'พัชรพร',surname:'เนินกร่าง',gender: 'f',birth:'18-4-2006',grade: '6'},
    {nickname: 'เนย',school: 'โรงเรียนรัตนโกสินทร์-รังสิต',tel_student:'090-984-2289',tel_parent:'081-617-7474',name:'พีรยา',surname:'ฟักสุข',gender: 'f',birth:'9-2-2006',grade: '6'},
    {nickname: 'กัน',school: 'โรงเรียนโชคชัยรังสิต',tel_student:'098-953-3190',tel_parent:'087-025-1441',name:'พลสรรค์',surname:'วัฒนพรพิพัฒน์',gender: 'm',birth:'5-12-2005',grade: '6'},
    {nickname: 'แม็ก',school: 'โรงเรียนเซนต์โยเซฟเมืองเอก',tel_student:'086-391-7341',tel_parent:'081-949-0838',name:'ธนาธิป',surname:'เย็นใย',gender: 'm',birth:'29-11-2005',grade: '6'},
    {nickname: 'แพร',school: 'โรงเรียนเซนต์โยเซฟเมืองเอก',tel_student:'097-257-0986',tel_parent:'089-203-2925',name:'พิมพิชชา',surname:'เจริญฤทธิ์วัฒนา',gender: 'f',birth:'26-5-2006',grade: '6'},
    {nickname: 'อุ้ม',school: 'โรงเรียนธัญวิทย์',tel_student:'',tel_parent:'089-495-5538',name:'สุชานันท์',surname:'พวงนาค',gender: 'f',birth:'2-12-2005',grade: '6'},
    {nickname: 'เบนซ์',school: 'โรงเรียนพระหฤทัยนนทบุรี',tel_student:'090-642-6493',tel_parent:'061-745-6361',name:'จิรวรรณ',surname:'มั่งมีผล',gender: 'f',birth:'29-11-2005',grade: '6'},
    {nickname: 'โชกุน',school: 'โรงเรียนธัญวิทย์',tel_student:'',tel_parent:'083-079-5746',name:'สหรัฐ',surname:'เอี่ยมธนากุล',gender: 'm',birth:'16-9-2005',grade: '6'},
    {nickname: 'โฟร์โมสต์',school: 'โรงเรียนธัญวิทย์',tel_student:'089-905-5754',tel_parent:'089-905-5754',name:'วัฒนพงศ์',surname:'อ่ำทิพย์',gender: 'm',birth:'29-11-2005',grade: '6'},
    {nickname: 'ตาต้า',school: 'โรงเรียนเซนต์โยเซฟเมืองเอก',tel_student:'095-118-2059',tel_parent:'081-614-7765',name:'ธนกฤต',surname:'ติยะวัฒน์วิทยา',gender: 'm',birth:'17-4-2006',grade: '6'},
    {nickname: 'โชกุน',school: 'โรงเรียนธัญวิทย์',tel_student:'',tel_parent:'081-830-2270',name:'โชกุน',surname:'งามเสถียร',gender: 'm',birth:'7-9-2005',grade: '6'},
    {nickname: 'เนเจอร์',school: 'โรงเรียนศรีจิตรา',tel_student:'091-603-2163',tel_parent:'084-655-5796',name:'วสุพล',surname:'พานิชย์กิจเจริญ',gender: 'm',birth:'19-10-2005',grade: '6'},
    {nickname: 'แก้ม',school: 'โรงเรียนรังสิตวิทยา',tel_student:'065-019-5119',tel_parent:'081-985-3930',name:'ชาลิสา',surname:'พยัคฆ์ขาม',gender: 'f',birth:'31-5-2005',grade: '6'},
    {nickname: 'เฟิร์ส',school: 'โรงเรียนพระหฤทัยนนทบุรี',tel_student:'095-890-2905',tel_parent:'089-109-5190',name:'ณัฐสิทธิ์',surname:'ภู่เจริญกิจศิลป์',gender: 'm',birth:'2-8-2005',grade: '6'},
    {nickname: 'พอ',school: 'โรงเรียนพระหฤทัยนนทบุรี',tel_student:'',tel_parent:'081-840-6375',name:'พอ',surname:'คงลำธาร',gender: 'm',birth:'1-4-2006',grade: '6'},
    {nickname: 'มีมี่',school: 'โรงเรียนเซนต์โยเซฟเมืองเอก',tel_student:'',tel_parent:'089-203-7455',name:'ปลายฟ้า',surname:'พงษ์ศรีหดุลชัย',gender: 'f',birth:'5-1-2006',grade: '6'},
    {nickname: 'น้ำขิง',school: 'โรงเรียนประถมศึกษาธรรมศาสตร์',tel_student:'',tel_parent:'089-077-7743',name:'ปริชญา',surname:'ทองชุบ',gender: 'f',birth:'15-9-2005',grade: '6'},
    {nickname: 'ผิงผิง',school: 'โรงเรียนไผทอุดมศึกษา',tel_student:'081-666-0960',tel_parent:'081-644-8231',name:'บิวมิญช์',surname:'นิตย์วิชญ์กร',gender: 'f',birth:'12-5-2006',grade: '6'},
    {nickname: 'พั้นช์',school: 'โรงเรียนจิตรลดา',tel_student:'065-510-8490',tel_parent:'081-805-8490',name:'ธัญวรัตม์',surname:'เพ็ชรเจริญ',gender: 'f',birth:'13-3-2006',grade: '6'},
    {nickname: 'ภู',school: 'โรงเรียนธัญวิทย์',tel_student:'',tel_parent:'087-683-3448',name:'ภูริทัศน์',surname:'กองพิลา',gender: 'm',birth:'8-6-2005',grade: '6'},
    {nickname: 'นาย',school: 'โรงเรียนประถมศึกษาธรรมศาสตร์',tel_student:'093-145-9399',tel_parent:'086-826-5149',name:'กฤษณะพงศ์',surname:'แก้วสน',gender: 'm',birth:'17-2-2006',grade: '6'},
    {nickname: 'ป๊อป',school: 'โรงเรียนโชคชัยรังสิต',tel_student:'086-122-8118',tel_parent:'087-087-9929',name:'ธีรภัทร',surname:'แจ่มรัศมี',gender: 'm',birth:'15-11-2005',grade: '6'},
    {nickname: 'พั้นช์',school: 'โรงเรียนพระหฤทัยนนทบุรี',tel_student:'087-484-7575',tel_parent:'083-960-6316',name:'พิมณภัทร',surname:'สุวรรณธนรักษ์',gender: 'f',birth:'19-7-2006',grade: '6'},
    {nickname: 'ทีที',school: 'โรงเรียนพระหฤทัยนนทบุรี',tel_student:'090-952-1395',tel_parent:'064-953-2698',name:'ชนาเมธ',surname:'รัชวานิชกุล',gender: 'm',birth:'20-6-2006',grade: '6'},
    {nickname: 'แทน',school: 'โรงเรียนเซนต์โยเซฟเมืองเอก',tel_student:'095-181-8922',tel_parent:'086-786-9290',name:'ธีชิษณุ',surname:'ผ่องแผ้ว',gender: 'm',birth:'22-7-2005',grade: '6'},
    {nickname: 'หมาก',school: 'โรงเรียนศรีจิตรา',tel_student:'094-873-3377',tel_parent:'081-304-3609',name:'กฤติธี',surname:'ศรีวิเชียร',gender: 'm',birth:'5-8-2005',grade: '6'},
    {nickname: 'พลอย',school: 'โรงเรียนธัญวิทย์',tel_student:'',tel_parent:'094-819-0007',name:'พรพรหม',surname:'สุดขาว',gender: 'f',birth:'19-12-2005',grade: '6'},
    {nickname: 'วิว',school: 'โรงเรียนพระหฤทัยนนทบุรี',tel_student:'096-360-8292',tel_parent:'083-713-7762',name:'ยศวรรธน์',surname:'ศิริวัฒนานนท์',gender: 'm',birth:'19-2-2005',grade: '6'},
    {nickname: 'จั๋ง',school: 'โรงเรียนเซนต์โยเซฟเมืองเอก',tel_student:'097-240-1305',tel_parent:'061-661-4545',name:'ชนพัฒน์',surname:'หทัยธีร',gender: 'm',birth:'13-6-2004',grade: '6'},
    {nickname: 'พลอย',school: 'โรงเรียนทิพพากรวิทยาการ',tel_student:'',tel_parent:'089-661-5171',name:'ฐิตาภรณ์',surname:'พานทอง',gender: 'f',birth:'21-8-2005',grade: '6'},
    {nickname: 'การ์ตูน',school: 'โรงเรียนเซนต์ฟรังซีสเซเวียร์',tel_student:'',tel_parent:'081-907-2328',name:'กันต์ธีร์',surname:'สภาเผ่ายืนยง',gender: '-',birth:'1-4-2006',grade: '6'},
    {nickname: 'เจ',school: 'โรงเรียนทิพพากรวิทยาการ',tel_student:'095-584-1192',tel_parent:'086-771-6272',name:'วชิระ',surname:'หนูแก้ว',gender: 'm',birth:'16-4-2006',grade: '6'},
    {nickname: 'แมงปอ',school: 'โรงเรียนเซนต์โยเซฟเมืองเอก',tel_student:'',tel_parent:'085-957-7455',name:'พศิน',surname:'เงินปาน',gender: 'm',birth:'17-9-2005',grade: '6'},
    {nickname: 'เจมส์',school: 'โรงเรียนธัญวิทย์',tel_student:'095-001-1536',tel_parent:'085-047-6305',name:'กิตติพัฒน์',surname:'จิรรัตน์พิพักษ์',gender: 'm',birth:'31-3-2006',grade: '6'},
    {nickname: 'แพร',school: 'โรงเรียนเซนต์โยเซฟเมืองเอก',tel_student:'097-257-0986',tel_parent:'098-270-2925',name:'พิมพิชชา',surname:'เจริญฤทธิ์วัฒนา',gender: 'f',birth:'29-5-2006',grade: '6'},
    {nickname: 'วุ้น',school: 'โรงเรียนธัญวิทย์',tel_student:'099-920-9956',tel_parent:'062-942-9924',name:'ณัฏฐ์ภรณ์',surname:'พันธ์หว้า',gender: 'f',birth:'26-10-2005',grade: '6'},
    {nickname: 'ไทด์',school: 'โรงเรียนสารสาสน์วิเทศราชพฤกษ์',tel_student:'061-516-3482',tel_parent:'088-664-1234',name:'ฐปนวัฒน์',surname:'อินทรสกุล',gender: 'm',birth:'20-3-2006',grade: '6'},
    {nickname: 'แทน',school: 'โรงเรียนพระหฤทัยนนทบุรี',tel_student:'',tel_parent:'098-853-9914',name:'ณัฐนนท์',surname:'แสงนวล',gender: 'm',birth:'10-10-2005',grade: '6'},
    {nickname: 'เจอาร์',school: 'โรงเรียนธัญวิทย์',tel_student:'096-463-5002',tel_parent:'086-563-0071',name:'ปัรณวิชญ์',surname:'โพธิ์สพ',gender: 'm',birth:'15-12-2005',grade: '6'},
    {nickname: 'หมอนอิง',school: 'โรงเรียนพระหฤทัยนนทบุรี',tel_student:'086-358-0423',tel_parent:'095-385-9528',name:'ศดานันท์',surname:'วิจิตรศรีวงศ์',gender: 'f',birth:'24-6-2006',grade: '6'},
    {nickname: 'น้ำหนึ่ง',school: 'โรงเรียนวัฒนาวิทยาลัย',tel_student:'081-912-9648',tel_parent:'084-521-4646',name:'พิชฌาย์พร',surname:'สนธิสุทธิ์',gender: 'f',birth:'24-5-2005',grade: '7'},
    {nickname: 'นักบิน',school: 'โรงเรียนธัญวิทย์',tel_student:'086-492-9582',tel_parent:'089-153-8660',name:'อชิตพล',surname:'จินดาพรรณ',gender: 'm',birth:'29-1-2005',grade: '7'},
    {nickname: 'จีจี้',school: 'โรงเรียนสายปัญญารังสิต',tel_student:'061-647-2719',tel_parent:'084-557-2674',name:'ปิยะวรรณ์',surname:'สังฆกรณ์ชนก',gender: 'f',birth:'30-3-2005',grade: '7'},
    {nickname: 'ปูน',school: 'โรงเรียนสายปัญญารังสิต',tel_student:'-',tel_parent:'083-135-4499',name:'แก้วทิพย์',surname:'โพธิ์ทอง',gender: 'f',birth:'20-10-2004',grade: '7'},
    {nickname: 'ข้าวปาย',school: 'โรงเรียนสวนกุหลาบวิทยาลัย รังสิต',tel_student:'092-708-8802',tel_parent:'081-336-1104',name:'สิทธิ',surname:'แสงสุข',gender: 'm',birth:'1-1-2005',grade: '7'},
    {nickname: 'มอส',school: 'โรงเรียนปทุมวิไล',tel_student:'098-491-7726',tel_parent:'089-661-8475',name:'ธนพล',surname:'แก้ววิสัย',gender: 'm',birth:'30-5-2005',grade: '7'},
    {nickname: 'ติวเตอร์',school: 'โรงเรียนพระหฤทัยนนทบุรี',tel_student:'099-125-2626',tel_parent:'085-110-5572',name:'ณฐนนท์',surname:'เนระแก',gender: 'm',birth:'27-9-2004',grade: '7'},
    {nickname: 'กานต์',school: 'โรงเรียนสวนกุหลาบวิทยาลัย รังสิต',tel_student:'083-720-3375',tel_parent:'095-108-5633',name:'กานต์',surname:'หัสแดง',gender: 'm',birth:'28-10-2005',grade: '7'},
    {nickname: 'ภูริ',school: 'โรงเรียนสวนกุหลาบวิทยาลัย รังสิต',tel_student:'094-506-6110',tel_parent:'089-783-9605',name:'ภูริวัจน์',surname:'เกิดแก้ว',gender: 'm',birth:'11-9-2004',grade: '7'},
    {nickname: 'ข้าวฟ่าง',school: 'โรงเรียนหอวัง',tel_student:'096-829-1166',tel_parent:'095-469-6116',name:'ณัฎฐพัชร',surname:'อารมณ์รัตน์',gender: 'f',birth:'',grade: '7'},
    {nickname: 'เอเชีย',school: 'โรงเรียนสายปัญญารังสิต',tel_student:'-',tel_parent:'095-493-7888',name:'เจษฎา',surname:'สุทธิรอด',gender: 'm',birth:'15-10-2002',grade: '7'},
    {nickname: 'ซี',school: 'โรงเรียนหอวัง',tel_student:'088-810-1683',tel_parent:'089-812-3909',name:'ธีชพนธ์',surname:'ปิ่นแก้ว',gender: 'm',birth:'12-7-2005',grade: '7'},
    {nickname: 'แซนด์',school: 'โรงเรียนหอวัง',tel_student:'088-810-1682',tel_parent:'089-812-3909',name:'พีรันธร',surname:'ปิ่นแก้ว',gender: 'f',birth:'12-7-2005',grade: '7'},
    {nickname: 'บีม',school: 'โรงเรียนหอวัง',tel_student:'087-508-9188',tel_parent:'099-247-9950',name:'อธิภัทร',surname:'ศิวะตระกูล',gender: 'm',birth:'8-9-2004',grade: '7'},
    {nickname: 'มิกซ์',school: 'โรงเรียนคณะราษฎร์บำรุงปทุมธานี',tel_student:'089-787-0435',tel_parent:'087-674-9290',name:'สิรธีร์',surname:'เอี่ยมสำอางค์',gender: 'm',birth:'6-9-2003',grade: '7'},
    {nickname: 'ท้องฟ้า',school: 'โรงเรียนนวมินทราชินูทิศ หอวัง นนทบุรี',tel_student:'097-257-2746',tel_parent:'089-139-6863',name:'ภาสกร',surname:'นาคา',gender: 'm',birth:'27-11-2003',grade: '8'},
    {nickname: 'น้ำ',school: 'โรงเรียนสาธิตแห่งมหาวิทยาลัยเกษตรศาสตร์',tel_student:'096-752-6907',tel_parent:'080-292-7887',name:'ไอริน',surname:'สุขเลิศวรกุล',gender: 'f',birth:'6-6-2004',grade: '8'},
    {nickname: 'วิว',school: 'โรงเรียนหอวัง',tel_student:'095-510-6902',tel_parent:'095-250-8969',name:'ภาธร',surname:'สอนไทย',gender: 'm',birth:'14-1-2004',grade: '8'},
    {nickname: 'มีมี่',school: 'โรงเรียนหอวัง',tel_student:'062-013-1212',tel_parent:'061-989-8811',name:'ณัฐกฤต',surname:'แย้มคลี่',gender: 'f',birth:'20-11-2003',grade: '8'},
    {nickname: 'กาย',school: 'โรงเรียนสายปัญญารังสิต',tel_student:'081-344-9400',tel_parent:'081-637-7879',name:'กฤติน',surname:'วรมณีจินดา',gender: 'm',birth:'2-4-2004',grade: '8'},
    {nickname: 'หยงหยง',school: 'โรงเรียนหอวัง',tel_student:'095-001-8382',tel_parent:'094-295-3642',name:'อิงครัตน์',surname:'พัฒนาพงศ์สิน',gender: 'f',birth:'6-5-2004',grade: '8'},
    {nickname: 'ก้อง',school: 'โรงเรียนหอวัง',tel_student:'093-159-6958',tel_parent:'092-368-3729',name:'จิรภัทร',surname:'ศรีศุภร',gender: 'm',birth:'3-4-2004',grade: '8'},
    {nickname: 'หลิง',school: 'โรงเรียนสวนกุหลาบวิทยาลัย รังสิต',tel_student:'094-783-9607',tel_parent:'081-257-4665',name:'ชุติกนิษฐ์ภา',surname:'เจริญลาภนพรัตน์',gender: 'f',birth:'24-9-2004',grade: '8'},
    {nickname: 'เจนนี่',school: 'โรงเรียนหอวัง',tel_student:'092-990-6107',tel_parent:'081-829-1007',name:'ณัฐณิชา',surname:'เหล่าพิพัฒนา',gender: 'f',birth:'9-9-2006',grade: '8'},
    {nickname: 'อัพ',school: 'โรงเรียนคณะราษฎร์บำรุงปทุมธานี',tel_student:'080-109-0683',tel_parent:'084-360-3557',name:'ทักษิณ',surname:'มีซอง',gender: 'm',birth:'9-4-2004',grade: '8'},
    {nickname: 'ภพ',school: 'โรงเรียนหอวัง',tel_student:'089-301-7884',tel_parent:'087-514-4475',name:'กิตติภพ',surname:'บริสุทธิ์',gender: 'm',birth:'16-4-2004',grade: '8'},
    {nickname: 'ตง',school: 'โรงเรียนหอวัง',tel_student:'',tel_parent:'089-111-8897',name:'ณชนก',surname:'เสรีสุภัคกุล',gender: 'm',birth:'2-8-2004',grade: '8'},
    {nickname: 'ใบเฟิร์น',school: 'โรงเรียนหอวัง',tel_student:'081-492-8192',tel_parent:'095-406-5516',name:'จีรณา',surname:'ศรีบุญ',gender: 'f',birth:'12-10-2003',grade: '8'},
    {nickname: 'แพท',school: 'โรงเรียนสารสาสน์วิเทศรังสิต',tel_student:'-',tel_parent:'063-553-6556',name:'วชิรวิช',surname:'ลิมปสนธิพงศ์',gender: 'm',birth:'3-4-2004',grade: '8'},
    {nickname: 'อ๋อม',school: 'โรงเรียนสารสาสน์วิเทศคลองหลวง',tel_student:'098-910-8525',tel_parent:'098-910-9830',name:'ปูริดา',surname:'แสงประเสริฐ',gender: 'f',birth:'8-1-2003',grade: '8'},
    {nickname: 'พร้อม',school: 'โรงเรียนหอวัง',tel_student:'097-134-5118',tel_parent:'062-597-3697',name:'ประวีณ',surname:'บรรจงประพันธ์',gender: 'm',birth:'4-8-2004',grade: '8'},
    {nickname: 'พลอย',school: 'โรงเรียนคณะราษฎร์บำรุงปทุมธานี',tel_student:'094-552-2881',tel_parent:'099-282-1113',name:'แพรพลอย',surname:'ประสิทธิ์',gender: 'f',birth:'23-2-2004',grade: '8'},
    {nickname: 'บอสตัน',school: 'โรงเรียนสวนกุหลาบวิทยาลัย',tel_student:'-',tel_parent:'086-609-5398',name:'ธนวัฒน์',surname:'แก้วอุ่น',gender: 'm',birth:'7-8-2003',grade: '8'},
    {nickname: 'ภู',school: 'โรงเรียนสายปัญญารังสิต',tel_student:'083-031-4876',tel_parent:'089-967-7757',name:'สรสิช',surname:'สุดสวรรน',gender: 'm',birth:'21-8-2003',grade: '8'},
    {nickname: 'บัว',school: 'โรงเรียนหอวัง',tel_student:'095-953-8441',tel_parent:'086-386-0139',name:'บุษจินดา',surname:'เตชจินดาวงศ์',gender: 'f',birth:'15-4-2004',grade: '8'},
    {nickname: 'แพท',school: 'โรงเรียนนวมินทราชินูทิศ หอวัง นนทบุรี',tel_student:'084-917-1204',tel_parent:'062-863-4505',name:'ภัทรกันยื',surname:'ใจเย็น',gender: 'f',birth:'26-4-2004',grade: '8'},
    {nickname: 'ปอนส์',school: 'โรงเรียนสาธิตแห่งมหาวิทยาลัยเกษตรศาสตร์',tel_student:'061-389-9946',tel_parent:'081-925-0725',name:'วงศธร',surname:'โมกขะวรรธนะ',gender: 'm',birth:'7-7-2003',grade: '9'},
    {nickname: 'นอร์ท',school: 'โรงเรียนพิชญศึกษา',tel_student:'090-889-6333',tel_parent:'081-639-0005',name:'ธรรมภณ',surname:'สอาดโฉม',gender: 'm',birth:'20-1-2003',grade: '9'},
    {nickname: 'พลอย',school: 'โรงเรียนคณะราษฎร์บำรุงปทุมธานี',tel_student:'062-342-9306',tel_parent:'086-103-1459',name:'ธันยพร',surname:'น้อยบุญสุข',gender: 'f',birth:'6-1-2003',grade: '9'},
    {nickname: 'เนปจูน',school: 'โรงเรียนคณะราษฎร์บำรุงปทุมธานี',tel_student:'063-224-8981',tel_parent:'084-387-8638',name:'สิทธิภาคย์',surname:'ศรีสวัสดิ์',gender: 'm',birth:'12-10-2002',grade: '9'},
    {nickname: 'อั้ม',school: 'โรงเรียนคณะราษฎร์บำรุงปทุมธานี',tel_student:'094-223-9679',tel_parent:'086-071-2423',name:'สุชานาถ',surname:'ยอดเกวียน',gender: 'f',birth:'23-2-2003',grade: '9'},
    {nickname: 'แพรว',school: 'โรงเรียนคณะราษฎร์บำรุงปทุมธานี',tel_student:'094-552-5492',tel_parent:'099-282-1113',name:'ณัฐณิชา',surname:'ประสิทธิ์',gender: 'f',birth:'1-8-2002',grade: '9'},
    {nickname: 'มิ้นท์',school: 'โรงเรียนคณะราษฎร์บำรุงปทุมธานี',tel_student:'093-027-7281',tel_parent:'080-079-9139',name:'พิชญาภา',surname:'พานิชการ',gender: 'f',birth:'22-7-2003',grade: '9'},
    {nickname: 'ฟักทอง',school: 'โรงเรียนสวนกุหลาบวิทยาลัย',tel_student:'098-278-6981',tel_parent:'081-341-6868',name:'ณัฐธยาน์',surname:'เพชรปานกัน',gender: 'f',birth:'18-5-2003',grade: '9'},
    {nickname: 'สหรัฐ',school: 'โรงเรียนสายปัญญารังสิต',tel_student:'062-585-0242',tel_parent:'085-160-0483',name:'สหรัฐ',surname:'ศรีผุดผ่อง',gender: 'm',birth:'14-6-2002',grade: '9'},
    {nickname: 'เก้า',school: 'โรงเรียนสายปัญญารังสิต',tel_student:'-',tel_parent:'081-861-4156',name:'ภัทรพล',surname:'ปิ่นทอง',gender: 'm',birth:'',grade: '9'},
    {nickname: 'บอล',school: 'โรงเรียนสายปัญญารังสิต',tel_student:'095-759-8710',tel_parent:'089-810-4049',name:'วราเทพ',surname:'จำเรียง',gender: 'm',birth:'18-8-2002',grade: '9'},
    {nickname: 'โน้ต',school: 'โรงเรียนสวนกุหลาบวิทยาลัย รังสิต',tel_student:'086-509-4145',tel_parent:'084-154-4159',name:'สรวิศิษฏ์',surname:'จันทร์เพ็ญ',gender: 'm',birth:'29-5-2003',grade: '9'},
    {nickname: 'เบสท์',school: 'โรงเรียนสายปัญญารังสิต',tel_student:'095-057-9606',tel_parent:'086-992-5196',name:'ธีรภัทร์',surname:'อุทัยวัฒน์',gender: 'm',birth:'12-6-2001',grade: '10'},
    {nickname: 'แนน',school: 'โรงเรียนธัญบุรี',tel_student:'095-829-4523',tel_parent:'081-376-0540',name:'อรรัมภา',surname:'โพธิ์เย็น',gender: 'f',birth:'6-12-2001',grade: '10'},
    {nickname: 'นุ่น',school: 'โรงเรียนธัญบุรี',tel_student:'098-830-3396',tel_parent:'087-907-6395',name:'คุณัญญา',surname:'พลอยแดง',gender: 'f',birth:'10-5-2001',grade: '10'},
    {nickname: 'โย',school: 'โรงเรียนสวนกุหลาบวิทยาลัย นนทบุรี',tel_student:'083-562-8190',tel_parent:'086-908-5599',name:'เจริญยิ่ง',surname:'ทนงค์',gender: 'm',birth:'14-9-2000',grade: '11'},
    {nickname: 'ต้นน้ำ',school: 'โรงเรียนคณะราษฎร์บำรุงปทุมธานี',tel_student:'098-398-4161',tel_parent:'089-895-4165',name:'อนงค์นาถ',surname:'ชัยสุริยะพันธ์',gender: 'f',birth:'5-2-2000',grade: '11'},
    {nickname: 'มิ้งค์',school: 'โรงเรียนคณะราษฎร์บำรุงปทุมธานี',tel_student:'099-451-1818',tel_parent:'089-661-8475',name:'เสาวลักษณ์',surname:'แก้ววิลัย',gender: 'f',birth:'28-12-2000',grade: '11'},
    {nickname: 'พลอย',school: 'โรงเรียนสวนกุหลาบวิทยาลัย รังสิต',tel_student:'099-092-6198',tel_parent:'088-374-4261',name:'ณัชชา',surname:'ธนาธรนิรันดร',gender: 'f',birth:'26-10-1999',grade: '12'},
    {nickname: 'หงส์',school: 'โรงเรียนสวนกุหลาบวิทยาลัย รังสิต',tel_student:'061-447-1386',tel_parent:'081-845-1946',name:'นฤนันต์',surname:'ร่วมญาติ',gender: 'f',birth:'10-3-2000',grade: '12'},
    {nickname: 'นันท์',school: 'โรงเรียนสวนกุหลาบวิทยาลัย รังสิต',tel_student:'086-393-7262',tel_parent:'089-519-6670',name:'พัทธนันท์',surname:'ธนฤทธิไกรกุล',gender: 'f',birth:'3-1-2000',grade: '12'},
    {nickname: 'ใบหม่อน',school: 'โรงเรียนสวนกุหลาบวิทยาลัย รังสิต',tel_student:'062-267-8988',tel_parent:'086-047-3364',name:'ภูษิดา',surname:'เต็งยี่',gender: 'f',birth:'11-4-2000',grade: '12'},
    {nickname: 'เบลล์',school: 'โรงเรียนเซนต์โยเซฟเมืองเอก',tel_student:'083-064-8128',tel_parent:'081-949-0838',name:'ณิชกานต์',surname:'เย้นใย',gender: 'f',birth:'8-10-1999',grade: '12'},
    {nickname: 'เอ',school: 'โรงเรียนสายปัญญารังสิต',tel_student:'092-601-8444',tel_parent:'089-814-1408',name:'โชติพงศ์',surname:'ศรีสุวรรณ์',gender: 'm',birth:'20-8-1999',grade: '12'},
    {nickname: 'ซัน',school: 'โรงเรียนสวนกุหลาบวิทยาลัย รังสิต',tel_student:'098-270-9767',tel_parent:'081-926-2715',name:'วัชรนนท์',surname:'ศตวัฒนเศรษฐ์',gender: 'm',birth:'21-12-1999',grade: '12'},
    {nickname: 'บีม',school: 'โรงเรียนคณะราษฎร์บำรุงปทุมธานี',tel_student:'097-978-2545',tel_parent:'089-527-3445',name:'มณีรัตน์',surname:'พันพิลา',gender: 'f',birth:'29-5-2000',grade: '12'},
    {nickname: 'ลูกปัด',school: 'โรงเรียนคณะราษฎร์บำรุงปทุมธานี',tel_student:'094-498-8307',tel_parent:'089-414-0830',name:'ไพลิน',surname:'โสมบัส',gender: 'f',birth:'12-5-2000',grade: '12'},
    {nickname: 'ปุ๋ม',school: 'โรงเรียนผ่องสุวรรณวิทยา',tel_student:'-',tel_parent:'081-454-6910',name:'ณัฐชยา',surname:'ตัวตน',gender: 'f',birth:'19-9-2010',grade: '1'},
    {nickname: 'พอร์ช',school: 'โรงเรียนอรรถมิตร',tel_student:'-',tel_parent:'081-720-4277',name:'สิรวิชญ์',surname:'พานทอง',gender: 'm',birth:'1-9-2011',grade: '1'},
    {nickname: 'พริกไทย',school: '-',tel_student:'-',tel_parent:'081-341-6868',name:'สุกฤตา',surname:'เพชรปานกัน',gender: 'f',birth:'8-5-2010',grade: '2'},
    {nickname: 'โอ',school: 'โรงเรียนวัดป่างิ้ว',tel_student:'-',tel_parent:'094-784-7338',name:'ศุภโชค',surname:'พุฒจรูญ',gender: 'm',birth:'4-8-2008',grade: '3'},
    {nickname: 'ตั้ม',school: 'โรงเรียนวัดหงส์ปทุมาวาส',tel_student:'-',tel_parent:'086-896-0045',name:'กิตติพัฒน์',surname:'วรเนตรสุดาทิพย์',gender: 'm',birth:'5-9-2008',grade: '3'},
    {nickname: 'เพียง',school: '-',tel_student:'-',tel_parent:'081-840-6375',name:'เพียงฤทัย',surname:'คงลำธาร',gender: 'f',birth:'8-2-2008',grade: '4'},
    {nickname: 'มายด์',school: 'โรงเรียนมาลาสวรรค์พิทยา',tel_student:'-',tel_parent:'096-718-4655',name:'พรวรินท์',surname:'กาฬแก้ว',gender: 'f',birth:'27-4-2008',grade: '4'},
    {nickname: 'โบกี้',school: 'โรงเรียนวัดดอนเมือง(ทหารอากาศอุทิศ)',tel_student:'-',tel_parent:'086-387-2353',name:'พิชญุตม์',surname:'ขวัญทอง',gender: 'f',birth:'17-8-2007',grade: '4'},
    {nickname: 'ใบเตย',school: 'โรงเรียนอนุบาลวัดอ่างทอง',tel_student:'087-119-6835',tel_parent:'081-345-7921',name:'หยาดน้ำฟ้า',surname:'สวัสดี',gender: 'f',birth:'31-10-2007',grade: '4'},
    {nickname: 'โปรแกรม',school: 'โรงเรียนอนุบาลสามเสนฯ',tel_student:'084-636-5991',tel_parent:'084-154-4769',name:'ปัณณวอชญ์',surname:'จันทร์เพ็ญ',gender: 'm',birth:'11-3-2008',grade: '4'},
    {nickname: 'พลับ',school: 'โรงเรียนชุมชนวัดบางขัน',tel_student:'-',tel_parent:'086-712-6115',name:'อัครวินท์',surname:'บุญเชย',gender: 'm',birth:'17-1-2007',grade: '5'},
    {nickname: 'เพชร',school: '-',tel_student:'-',tel_parent:'087-683-3448',name:'วชิรวิทย์',surname:'กองพิลา',gender: 'm',birth:'24-4-2007',grade: '5'},
    {nickname: 'อ้อม',school: 'โรงเรียนสารสาสน์วิเทศคลองหลวง',tel_student:'094-963-8373',tel_parent:'081-733-7871',name:'อภิยญา',surname:'บัวสำลี',gender: 'f',birth:'31-7-2007',grade: '5'},
    {nickname: 'เนส',school: 'โรงเรียนอนุบาลปทุมธานี',tel_student:'061-554-3622',tel_parent:'091-568-7955',name:'พีรณัฐ',surname:'ทำสวน',gender: 'm',birth:'13-3-2007',grade: '5'},
    {nickname: 'เชอรร์รี่',school: 'โรงเรียนอนุบาลพระนครศรีอยุธยา',tel_student:'061-458-1153',tel_parent:'087-404-4950',name:'ญาณิสา',surname:'ปิยะสิงห์',gender: 'f',birth:'1-9-2007',grade: '5'},
    {nickname: 'เก้า',school: 'โรงเรียนอรรถมิตร',tel_student:'-',tel_parent:'080-925-6455',name:'ธรรณกร',surname:'เตชะพลี',gender: 'm',birth:'17-9-2007',grade: '5'},
    {nickname: 'แพง',school: 'โรงเรียนอรรถมิตร',tel_student:'092-583-4790',tel_parent:'081-720-4277',name:'ขวัญข้าว',surname:'พานทอง',gender: 'f',birth:'28-12-2006',grade: '5'},
    {nickname: 'เท็ม',school: 'โรงเรียนพิทยรังสี',tel_student:'081-233-5640',tel_parent:'087-591-5252',name:'ธวัลรัตน์',surname:'ศรีสุข',gender: 'f',birth:'15-3-2005',grade: '6'},
    {nickname: 'เจเกอร์',school: 'โรงเรียนบ้านพลอย',tel_student:'',tel_parent:'089-890-9654',name:'รัชศร',surname:'พู่ทองคำ',gender: 'm',birth:'3-11-2005',grade: '6'},
    {nickname: 'ใบเตย',school: 'โรงเรียนเปรมฤทัย',tel_student:'098-342-8680',tel_parent:'061-576-5132',name:'ศุภิสรา',surname:'เกษมสุข',gender: 'f',birth:'18-6-2005',grade: '6'},
    {nickname: 'มิ้นต์',school: 'โรงเรียนมาลาสวรรค์พิทยา',tel_student:'',tel_parent:'096-718-4655',name:'ณฐมนต์',surname:'กาฬแก้ว',gender: 'f',birth:'19-12-2005',grade: '6'},
    {nickname: 'ปัณณ์',school: 'โรงเรียนวัดดอนเมือง(ทหารอากาศอุทิศ)',tel_student:'',tel_parent:'081-918-4610',name:'อิทธิวัฒน์',surname:'เทิดศักดิ์รุ่งนภา',gender: 'm',birth:'24-7-2005',grade: '6'},
    {nickname: 'เช็ค',school: 'โรงเรียนวัดเปรมประชากร',tel_student:'081-347-7189',tel_parent:'081-309-1272',name:'ธนกร',surname:'ปัญญา',gender: 'm',birth:'25-7-2005',grade: '6'},
    {nickname: 'พอลล่า',school: 'โรงเรียนสารสาสน์วิเทศบางบัวทอง',tel_student:'',tel_parent:'081-943-5048',name:'อัลิปรียา',surname:'โชคชัยวิศิษฎ์',gender: 'f',birth:'9-3-2006',grade: '6'},
    {nickname: 'นักรบ',school: 'โรงเรียนสารสาสน์วิเทศบางบัวทอง',tel_student:'086-774-1368',tel_parent:'091-770-1888',name:'นักรบ',surname:'นาวากิจกุล',gender: 'm',birth:'17-12-2005',grade: '6'},
    {nickname: 'ชิ',school: 'โรงเรียนอุดมวิทยา',tel_student:'',tel_parent:'061-593-1996',name:'พระนคร',surname:'ณ',gender: 'm',birth:'29-9-2006',grade: '6'},
    {nickname: 'น็อต',school: 'โรงเรียนอุดมวิทยา',tel_student:'096-232-9870',tel_parent:'094-483-3939',name:'องอาจ',surname:'วรดิษฐ์วงษ์',gender: 'm',birth:'28-8-2005',grade: '6'},
    {nickname: 'นิวส์',school: '-',tel_student:'096-826-8-2782',tel_parent:'088-099-2109',name:'กฤษฎา',surname:'ธรรมรินทร์',gender: 'm',birth:'18-12-2003',grade: '7'},
    {nickname: 'โอม',school: 'โรงเรียนดอนเมืองทหารอากาศบำรุง',tel_student:'095-391-4510',tel_parent:'082-646-2994',name:'ทรงภูมิ',surname:'ธรรมจารี',gender: 'm',birth:'1-9-2005',grade: '7'},
    {nickname: 'ฟาริด',school: '-',tel_student:'-',tel_parent:'081-933-3848',name:'พิชิตชัย',surname:'เชยเอี่ยม',gender: 'm',birth:'10-9-2004',grade: '7'},
    {nickname: 'ปลา',school: 'โรงเรียนธรรมศาสตร์คลองหลวงวิทยาคม',tel_student:'095-885-1538',tel_parent:'084-071-0848',name:'กริณการ์',surname:'ขำดี',gender: 'f',birth:'1-5-2004',grade: '8'},
    {nickname: 'พัฒน์',school: '-',tel_student:'096-202-2347',tel_parent:'081-841-1727',name:'พีรพัฒน์',surname:'ทองแจ่ม',gender: 'm',birth:'14-8-2003',grade: '8'},
    {nickname: 'ใบหม่อน',school: 'โรงเรียนธรรมศาสตร์คลองหลวงวิทยาคม',tel_student:'081-305-4777',tel_parent:'086-334-2178',name:'อลิชา',surname:'อานุภาพธรรม',gender: 'f',birth:'21-10-2002',grade: '9'},
    {nickname: 'รัน',school: 'โรงเรียนยอแซฟอยุธยา',tel_student:'094-438-3886',tel_parent:'081696-6548',name:'วรศิรันย์',surname:'กัมพูสิริ',gender: 'f',birth:'22-3-2003',grade: '9'},
    {nickname: 'โซดา',school: 'โรงเรียนสตรีวรนาถบางเขน',tel_student:'095-575-7767',tel_parent:'092-838-6663',name:'กันต์กวี',surname:'สีสัน',gender: 'f',birth:'9-12-2001',grade: '9'},
    {nickname: 'โฟร์',school: 'โรงเรียนธรรมศาสตร์คลองหลวงวิทยาคม',tel_student:'090-949-5225',tel_parent:'092-252-9850',name:'ญาณิสา',surname:'มะหะหมัด',gender: 'f',birth:'16-11-2001',grade: '10'},
    {nickname: 'เบ่ง',school: 'โรงเรียนสารสาสน์วิเทศบางบัวทอง',tel_student:'064-229-4387',tel_parent:'080-220-0353',name:'เมธัส',surname:'คงด่าน',gender: 'm',birth:'6-9-2000',grade: '11'},
    {nickname: 'ขนมจีน',school: 'โรงเรียนหอวัง ปทุมธานี',tel_student:'094-641-9899',tel_parent:'087-560-5299',name:'นิศาชล',surname:'นาคเมา',gender: 'f',birth:'23-1-2001',grade: '11'}
  ]

  def decode_student_year(grade)
    buddhist_era_factor = 43
    total_collage_year  = 13
    current_year_in_ad  = Time.now.strftime('%Y')[2..3].to_i
    decode_year         = current_year_in_ad + buddhist_era_factor + total_collage_year
    return ("%02d" % (decode_year - grade.to_i)).to_s
  end

  def decode_student_runner(grade)
    parser = []
    grade_count = Student.where(grade: grade).maximum("student_code")[3..4].to_i rescue 0
    return ("%03d" % (grade_count + 1)).to_s # rescue "001"

  end

  def detatched_student_code(grade)
    grader  = decode_student_year(grade)
    counter = decode_student_runner(grade)
    return "#{grader}#{counter}"
  end

  # Generate student
  students.each do |pupil|
    # track school_id
    # unless pupil[:school] == '-'
    #   if School.where(name: pupil[:school]).count == 0
    #     School.create!(name: pupil[:school])
    #   end
    #   school_id = School.where(name: pupil[:school]).first[:id]
    # else
    #   school_id = '-1'
    # end

    school_id = School.where(name: pupil[:school]).first[:id]

    # find or created
    if  Student.where(nickname: pupil[:nickname], name: pupil[:name], surname: pupil[:surname],school: school_id,grade: pupil[:grade].to_i ).count == 0
      detatched_code = detatched_student_code(pupil[:grade].to_i)
      @student = Student.create!(
        nickname:   pupil[:nickname],
        name:       pupil[:name],
        surname:    pupil[:surname],
        tel:        pupil[:tel_student],
        tel_parent: pupil[:tel_parent],
        school:     school_id,
        grade:      pupil[:grade].to_i ,
        gender:     pupil[:gender] ,
        birthday:   pupil[:birth] ,
        secret_id:  Random.new.rand(100_000..1_000_000).to_s ,
        student_code: detatched_code
      )
      puts "created new student code #{detatched_code} >>>"
    else
      puts "founded this student >>>"
    end

  end
end
