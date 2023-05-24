require 'rspec'
require './lib/course'
require './lib/student'

RSpec.describe Course do 
  before do
    @course = Course.new("Calculus", 2)  
    @student1 = Student.new({name: "Morgan", age: 21})
    @student2 = Student.new({name: "Jordan", age: 29})  
  end

  it 'exists' do
    expect(@course).to be_a(Course)
  end

  it 'has a name' do
    expect(@course.name).to eq("Calculus")
  end

  it 'has a capacity' do
    expect(@course.capacity).to eq(2)
  end

  it 'is initialized with no students' do
    expect(@course.students).to eq([])
  end

  it 'has no students, so is not full' do
    expect(@course.full?).to eq(false)
  end

  it 'can enroll students' do
    @course.enroll(@student1)
    @course.enroll(@student2)
    expect(@course.students).to eq([@student1, @student2])
  end

  it 'cannot enroll more students than capacity' do
    @course.enroll(@student1)
    @course.enroll(@student2)
    expect(@course.full?).to eq(true)
    @course.enroll(Student.new({name: "Mitch", age: 24}))
    expect(@course.students).to eq([@student1, @student2])
  end
end