class Gradebook
  attr_reader :instructor, :courses
  def initialize(instructor, courses)
    @instructor = instructor
    @courses = courses
  end

  def add_course(course)
    @courses << course
  end

  def list_all_students
    enrollment_list = {}
    @courses.each do |course|
      enrollment_list[course] = course.students
    end
    enrollment_list
  end

  def students_below(threshold)
    students = self.list_all_students.values.flatten
    students.select {|student| student.grade < threshold}
  end

  def all_grades
    grade_list = Hash.new{|grade_list, course| grade_list[course] = []}
    self.list_all_students.each do |course, students|
      students.each do |student|
        grade_list[course] << student.grade
      end
    end
    grade_list
  end

  def students_in_range(min, max)
    students = self.list_all_students.values.flatten
    students.select do |student|
      student.grade > min && student.grade < max
    end
  end
end
