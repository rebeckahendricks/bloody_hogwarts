require 'rails_helper'

RSpec.describe 'Student index page' do
  before :each do
    @student1 = Student.create!(name: 'Casseopia Black', age: 14, house: 'Slytherin')
    @student2 = Student.create!(name: 'Luna Lovegood', age: 13, house: 'Ravenclaw')
    @student3 = Student.create!(name: 'Harry Potter', age: 12, house: 'Gryffindor')
  end

  describe 'As a visitor' do
    describe 'When I visit "/students"' do
      it 'I see a list of students with the following information: name, age, house' do
        visit '/students'

        expect(page).to have_content(@student1.name)
        expect(page).to have_content(@student2.name)
        expect(page).to have_content(@student3.name)

        expect(page).to have_content(@student1.age)
        expect(page).to have_content(@student2.age)
        expect(page).to have_content(@student3.age)

        expect(page).to have_content(@student1.house)
        expect(page).to have_content(@student2.house)
        expect(page).to have_content(@student3.house)
      end

      it 'I see the average age of all students' do
        visit '/students'

        expect(page).to have_content("Average Age: 13")
      end

      it 'Shows students in alphabetical order' do
        visit '/students'

        expect(@student1.name).to appear_before(@student3.name)
        expect(@student3.name).to appear_before(@student2.name)
      end
    end
  end
end
