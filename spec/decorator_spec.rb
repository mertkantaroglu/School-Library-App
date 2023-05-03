require './decorator'
require './nameable'

describe Decorator do
  context 'Creating decorator test methods' do
    decorator = Decorator.new('josue rushanika')
    it 'sets decorator nameable as Josue Rushanika' do
      expect(decorator.nameable).to eql 'josue rushanika'
    end
  end
end
