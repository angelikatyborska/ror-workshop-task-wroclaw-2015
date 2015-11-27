puts "Seeds: start"
TEACHER_TITLES = %w(Dr. Prof. TA)
User.create!(email: 'admin@admin.com', password: 'adminadmin')

3.times do
  Teacher.create!(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    academic_title: TEACHER_TITLES.sample
  )
end

teachers = Teacher.all

['Computer Science 101', 'Mathematics 203', 'English 101', 'Spanish 101', 'Biology 102'].each do |subject|
  SubjectItem.create!(
    title: subject,
    teacher: teachers.sample
  )
end

25.times do
  Student.create!(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    birthdate: Faker::Date.between(19.years.ago, 15.years.ago)
  )
end

students = Student.all

SubjectItem.all.each do |subject_item|
  subject_item.students << students.sample(rand(5..10))
end

SubjectItem.all.each do |subject_item|
  subject_item.students.each do |student|
    rand(1..5).times do
      subject_item.subject_item_notes << SubjectItemNote.create(student: student,
                                                                subject_item: subject_item,
                                                                value: rand(1..6))
    end
  end
end

Student.all.sample(Student.all.length / 2).each do |student|
  rand(1..3).times do |i|
    Payment.create!(
      amount: 42.00,
      student: student,
      date: Date.today - i * 31
    )
  end
end

puts "Seeds: done"
