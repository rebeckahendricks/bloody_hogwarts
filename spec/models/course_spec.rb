require 'rails_helper'

RSpec.describe Course, type: :model do

  describe 'validations' do
    it {should validate_presence_of :name}
  end

  describe 'relationships' do
    it {should have_many :student_courses}
    it {should have_many(:students).through(:student_courses)}
  end

  before :each do
    @dark_arts = Course.create!(name: "Defense against the Dark Arts")
      @student1 = @dark_arts.students.create!(name: 'Casseopia Black', age: 14, house: 'Slytherin')
      @student2 = @dark_arts.students.create!(name: 'Harry Potter', age: 14, house: 'Gryffindor')
    @potions = Course.create!(name: "Potions")
    @herbology = Course.create!(name: "Herbology")
      @student3 = @herbology.students.create!(name: 'Luna Lovegood', age: 13, house: 'Ravenclaw')

  end

  describe '#enrollment' do
    it 'can calculate how many students are in each course' do
      expect(@dark_arts.enrollment).to eq(2)
      expect(@herbology.enrollment).to eq(1)
    end
  end

  describe '#sort_by_name' do
    it 'can sort courses alphabetically by name' do
      expect(Course.sort_by_name).to eq([@dark_arts, @herbology, @potions])
    end
  end
end
