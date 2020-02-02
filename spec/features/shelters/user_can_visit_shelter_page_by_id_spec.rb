require 'rails_helper'

RSpec.describe 'As a visitor', type: :feature do
  context 'I visit a shelter specific show page' do
    it 'shows me that shelters attributes' do
      good_dogs = Shelter.create(name: 'Good_Dogs',
                                  address: "123 way lane",
                                  city: "Denver",
                                  state: "CO" ,
                                 zip:  "80808"              )

       great_dogs = Shelter.create(name: 'Great_Dogs',
                                 address: "321 lane way",
                                 city: "Tulsa",
                                 state: "OK" ,
                                zip:  "08080")

      visit "/shelters/#{good_dogs.id}"

      expect(page).to have_content(good_dogs.name)
      expect(page).to have_content(good_dogs.address)
      expect(page).to have_content(good_dogs.city)
      expect(page).to have_content(good_dogs.state)
      expect(page).to have_content(good_dogs.zip)
      expect(page).to_not have_content(great_dogs.name)
    end
  end
end
