require 'rails_helper'

RSpec.describe 'as a visitor', type: :feature do
  describe 'and i visit a shelters page' do
    it 'I can delete a user' do
      lizards_only = Shelter.create(name: 'Lizards Only')

      visit "/shelters/#{lizards_only.id}"

      click_button 'Delete'

      expect(current_path).to eq('/shelters')
      expect(page).to_not have_content('Lizards Only')
    end
  end

end
