require 'rails_helper'

RSpec.describe Student, type: :model do

  describe 'validations' do
    it {should validate_presence_of :name}
    it {should validate_presence_of :age}
    it {should validate_presence_of :house}
  end

  describe 'relationships' do
    it {should have_many :student_courses}
    it {should have_many(:courses).through(:student_courses)}
  end

  describe '#average_age' do
    before :each do
      @student1 = Student.create!(name: 'Casseopia Black', age: 14, house: 'Slytherin')
      @student2 = Student.create!(name: 'Luna Lovegood', age: 13, house: 'Ravenclaw')
      @student3 = Student.create!(name: 'Harry Potter', age: 12, house: 'Gryffindor')
    end

    it 'can calculate the average age of students' do
      expect(Student.average_age).to eq(13)
    end

    it 'can sort students alphabetically by name' do
      expect(Student.sort_by_name).to eq([@student1, @student3, @student2])
    end
  end

end
