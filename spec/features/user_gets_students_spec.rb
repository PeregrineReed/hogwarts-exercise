require 'rails_helper'

feature 'As a user' do
  context 'when visiting the / page' do
    it 'can select all students by house' do

      visit '/'
      expect(page).to have_content('Hogwarts')
      select 'Slytherin', from: 'house'
      click_on 'Get Students'

      expect(current_path).to eq(search_path)

      expect(page).to have_content('Slytherin Students')
      expect(page).to have_css('.student', count: 22)
      within first('.student') do
        expect(page).to have_css('.id')
        expect(page).to have_css('.name')
      end
    end
  end
end
