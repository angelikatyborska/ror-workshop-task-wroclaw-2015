puts "Seeds: start"
TEACHER_TITLES = %w(Dr. Prof. TA)
User.create!(email: 'admin@admin.com', password: 'adminadmin')

mr_chang = Teacher.create(first_name: 'Ben', last_name: 'Chang', academic_title: 'TA')
mr_duncan = Teacher.create(first_name: 'Ian', last_name: 'Duncan', academic_title: 'Dr.')
mrs_slater = Teacher.create(first_name: 'Michelle', last_name: 'Slater', academic_title: 'Prof.')

SubjectItem.create!(title: 'Spanish 101', teacher: mr_chang)
SubjectItem.create!(title: 'Spanish 102', teacher: mr_chang)
SubjectItem.create!(title: 'Psychology 101', teacher: mr_duncan)
SubjectItem.create!(title: 'Psychology 102', teacher: mr_duncan)
SubjectItem.create!(title: 'Statistics 101', teacher: mrs_slater)

annie_kim = Student.create!(first_name: 'Annie', last_name: 'Kim', birthdate: '1990-09-12')
annie_edison = Student.create!(first_name: 'Annie', last_name: 'Edison', birthdate: '1990-12-19')

students_to_create = [
  { first_name: 'Jeff', last_name: 'Winger', birthdate: '1975-11-20' },
  { first_name: 'Britta', last_name: 'Perry', birthdate: '1980-10-19' },
  { first_name: 'Abed', last_name: 'Nadir', birthdate: '1990-03-24' },
  { first_name: 'Troy', last_name: 'Barnes', birthdate: '1989-12-04' },
  { first_name: 'Shirley', last_name: 'Bennet', birthdate: '1971-08-12' },
  { first_name: 'Pierce', last_name: 'Hawthorne', birthdate: '1944-11-27' },
  { first_name: 'Alex', last_name: 'Osbourne', birthdate: '1972-02-22' },
  { first_name: 'Leonard', last_name: 'Rodriguez', birthdate: '1925-07-01' },
  { first_name: 'Vaughn', last_name: 'Miller', birthdate: '1983-04-15' },
  { first_name: 'Rich', last_name: 'Stephenson', birthdate: '1977-01-20' },
  { first_name: 'Neil', last_name: 'Jenkins', birthdate: '1988-07-18' },
  { first_name: 'Vicki', last_name: 'Jenkins', birthdate: '1988-11-21' },
  { first_name: 'Garrett', last_name: 'Lambert', birthdate: '1981-05-08' },
  { first_name: 'Todd', last_name: 'Jacobson', birthdate: '1984-04-24' },
  { first_name: 'Eric', last_name: 'Wisniewski', birthdate: '1990-12-22' },
  { first_name: 'Pavel', last_name: 'Iwaszkiewicz', birthdate: '1990-12-22' },
  { first_name: 'Mark', last_name: 'Millot', birthdate: '1989-09-22' },
  { first_name: 'Harry', last_name: 'Jefferson', birthdate: '1920-12-01' },
  { first_name: 'Magnitude', last_name: 'Pop', birthdate: '1990-01-01' },
  { first_name: 'Rick', last_name: 'Subway', birthdate: '1982-10-13' },
  { first_name: 'Luis', last_name: 'Guzman', birthdate: '1956-08-28' },
  { first_name: 'Buddy', last_name: 'Austin', birthdate: '1972-03-30' },
  { first_name: 'Wu', last_name: 'Mei', birthdate: '1987-03-10' }
]

students_to_create.each { |student_params| Student.create!(student_params) }

# Annie Edison and Annie Kim are diligent students, they sign up for every class and only get the best grades
students = Student.where.not(first_name: 'Annie')

SubjectItem.all.each do |subject_item|
  subject_item.students << annie_edison
  subject_item.students << annie_kim
  subject_item.students << students.sample(rand(5..10))
end

SubjectItem.all.each do |subject_item|
  subject_item.subject_item_notes << SubjectItemNote.create(
    student: annie_edison,
    subject_item: subject_item,
    value: 5
  )

  subject_item.subject_item_notes << SubjectItemNote.create(
    student: annie_kim,
    subject_item: subject_item,
    value: 5
  )

  subject_item.students.where.not(first_name: 'Annie').each do |student|
    rand(1..5).times do
      subject_item.subject_item_notes << SubjectItemNote.create(
        student: student,
        subject_item: subject_item,
        value: rand(1..6)
      )
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
