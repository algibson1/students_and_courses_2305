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
end
