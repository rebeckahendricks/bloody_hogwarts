require 'rails_helper'

RSpec.describe 'Student show page' do
  before :each do
    @student1 = Student.create!(name: 'Casseopia Black', age: 14, house: 'Slytherin')
    @dark_arts = @student1.courses.create!(name: "Defense against the Dark Arts")
    @herbology = @student1.courses.create!(name: "Herbology")
    @potions = @student1.courses.create!(name: "Potions")
  end

  describe 'As a visitor' do
    describe 'when I visit "/students/:id"' do
      it 'I see a list of the students courses' do
        visit "/students/#{@student1.id}"

        expect(page).to have_content(@dark_arts.name)
        expect(page).to have_content(@herbology.name)
        expect(page).to have_content(@potions.name)
      end
    end
  end
end
