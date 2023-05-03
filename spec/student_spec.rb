require './student'
require './classroom'

describe Student do
  context 'Testing functionalities for Student class' do
    student = Student.new(15, 'Jane', true)
    it 'returns student information' do
      expect(student).to be_a Student
      expect(student.age).to eql 15
      expect(student.name).to eql 'Jane'
      expect(student.parent_permission).to eql true
    end

    it 'checks students plays hooky emoji' do
      expect(student.play_hooky).to eql('¯(ツ)/¯')
    end

    it 'sets the classroom for student' do
      student = Student.new(15, 'Jane', true)
      new_classroom = Classroom.new('Web Dev')
      student.classroom = new_classroom
      expect(new_classroom).to be_a Classroom
      expect(student.classroom.label).to eql 'Web Dev'
    end
  end
end
