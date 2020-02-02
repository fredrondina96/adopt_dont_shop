require 'rails_helper'

RSpec.describe "creating a new shelter" do
  it "can create a shelter" do
    shelter = Shelter.create(name: "Come get a dog")
    name = "Come get a dog"
    address = "123 Plymoth Way"
    city = "Denver"
    state = "CO"
    zip = "80237"

    visit "/shelters/new"

    fill_in 'shelter[name]', with: name
    fill_in 'shelter[address]', with: address
    fill_in 'shelter[city]', with: city
    fill_in 'shelter[state]', with: state
    fill_in 'shelter[zip]', with: zip

    click_on 'Create Shelter'


    expect(current_path).to eq("/shelters")
    expect(page).to have_content(name)
    expect(page).to have_content(address)
    expect(page).to have_content(city)
    expect(page).to have_content(state)
    expect(page).to have_content(zip)
  end
end
