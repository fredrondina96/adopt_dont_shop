require 'rails_helper'

RSpec.describe 'as a visitor', type: :feature do
  describe 'and i visit a shelters page' do
    it 'I can edit the attributes of the shelter' do
      birds_only = Shelter.create(name: 'birds only')
      name = "birds and dogs"
      visit "/shelters/#{birds_only.id}"

      click_on 'Edit'

      expect(current_path).to eq("/shelters/#{birds_only.id}/edit")
      fill_in :name, with: name


      click_on 'Update Shelter'
      expect(page).to_not have_content('birds only')
      expect(current_path).to eq("/shelters/#{birds_only.id}")
      expect(page).to have_content('birds and dogs')

    end
  end

end
