require 'rails_helper'

RSpec.describe 'Courses show page' do
  before :each do
    @dark_arts = Course.create!(name: "Defense against the Dark Arts")
      @student1 = @dark_arts.students.create!(name: 'Casseopia Black', age: 14, house: 'Slytherin')
      @student2 = @dark_arts.students.create!(name: 'Harry Potter', age: 14, house: 'Gryffindor')
    @potions = Course.create!(name: "Potions")
    @herbology = Course.create!(name: "Herbology")
      @student3 = @herbology.students.create!(name: 'Luna Lovegood', age: 13, house: 'Ravenclaw')
  end

  describe 'As a visitor' do
    describe 'when I visit "/courses"' do
      it 'I see a list of courses and the number of students enrolled in each course' do
        visit '/courses'

        expect(page).to have_content("Defense against the Dark Arts: 2")
        expect(page).to have_content("Herbology: 1")
      end

      it 'shows courses in alphabetical order by name' do
        visit '/courses'

        expect(@dark_arts.name).to appear_before(@herbology.name)
        expect(@herbology.name).to appear_before(@potions.name)
      end

      it 'shows students per course in alphabetical order' do
        visit '/courses'

        expect(page).to have_content(@student1.name)
        expect(page).to have_content(@student2.name)
        expect(@student1.name).to appear_before(@student2.name)
      end
    end
  end
end
