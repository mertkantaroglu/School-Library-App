require './teacher'

describe Teacher do
  context 'Testing functionalities for Teacher class' do
    teacher = Teacher.new('Web Dev', 40, 'Mert')
    it 'checks teacher information' do
      expect(teacher).to be_a Teacher
      expect(teacher.specialization).to eql 'Web Dev'
      expect(teacher.age).to eql 40
      expect(teacher.name).to eql 'Mert'
    end

    it 'checks teacher can use services?' do
      expect(teacher.can_use_services?).to eql true
    end

    it 'returns a hash representation of the teacher' do
      teacher = Teacher.new('Web Dev', 40, 'Mert')

      expected_hash = {
        id: teacher.instance_variable_get(:@id),
        age: 40,
        name: 'Mert',
        specialization: 'Web Dev',
        rentals: []
      }

      expect(teacher.to_h).to eq(expected_hash)
    end
  end
end
