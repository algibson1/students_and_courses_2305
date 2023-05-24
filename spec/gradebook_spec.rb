require 'rspec'
require './lib/course'
require './lib/student'
require './lib/gradebook'

RSpec.describe Gradebook do
  before do
    @course_1 = Course.new("Calculus", 2)
    @course_2 = Course.new("Science", 5)
    @course_3 = Course.new("Biology", 3)
    @student1 = Student.new({name: "Morgan", age: 21})
    @student1.log_score(83)
    @student1.log_score(72)
    @student2 = Student.new({name: "Jordan", age: 29})
    @student2.log_score(98)
    @student2.log_score(92)
    @student3 = Student.new({name: "Bob", age: 30})
    @student3.log_score(81)
    @student3.log_score(65)
    @student4 = Student.new({name: "Charlie", age: 22})
    @student4.log_score(92)
    @student4.log_score(81)
    @course_1.enroll(@student1)
    @course_1.enroll(@student2)
    @course_2.enroll(@student3)
    @course_3.enroll(@student4)
    @gradebook = Gradebook.new("Prof Sam", [@course_1, @course_2])
  end

  it 'exists' do
    expect(@gradebook).to be_a(Gradebook)
  end

  it 'has an instructor' do
    @expect(@gradebook.instructor).to eq("Prof Sam")
  end

  it 'has courses' do
    @expect(@gradebook.courses).to eq([@course_1, @course_2])
  end

  it 'can add more courses' do
    expect(@gradebook.add_course(@course_3)).to eq([@course_1, @course_2, @course_3])
  end

  it 'can list all enrolled students' do
    @gradebook.add_course(@course_3)
    expect(@gradebook.list_all_students).to eq({@course_1 => [@student1, @student2], @course_2 => [@student3], @course_3 => [@student4]})
  end

  it 'can list all students with grades below a given threshold' do
    @gradebook.add_course(@course_3)
    expect(@gradebook.students_below(80)).to eq([@student1, @student3])
    expect(@gradebook.students_below(90)).to eq([@student1, @student3, @student4])
  end
end