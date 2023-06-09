require './classroom'
require './student'

describe Classroom do
  context 'Creating classroom test methods' do
    classroom = Classroom.new('Computer Science')
    it 'checks the classroom info' do
      expect(classroom).to be_a Classroom
      expect(classroom.label).to eql 'Computer Science'
    end

    it 'adds students to classroom' do
      new_student = Student.new(24, 'Josue', true)
      classroom.students.push(new_student)
      expect(classroom.students).to include(new_student)
      expect(classroom.students.length).to eql 1
      expect(new_student.name).to eql 'Josue'
    end
  end
end
