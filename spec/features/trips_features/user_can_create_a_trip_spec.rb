require './spec/spec_helper'

RSpec.describe "when a user visits the new trip page" do
  it "they can create a new trip" do
    zipcode = Zipcode.create(zipcode: 94127)
    expect(Trip.all.count).to eq(0)

    visit('/trips/new')
    expect(page).to have_content("Add a new trip")
    #This should be calculated by end_date - start_date
    # fill_in("trip[duration]", with: 840)
    fill_in("trip[start_date]", with: "08/30/2013 12:45")
    fill_in("trip[start_station_id]", with: "squeevillia")
    fill_in("trip[end_date]", with: "08/30/2013 12:59")
    fill_in("trip[end_station_id]", with: "squeevillia")
    fill_in("trip[bike_id]", with: 500)
    fill_in("trip[subscription_type]", with: "Subscriber")
    fill_in("trip[zipcode_id]", with: 1)

    click_button("Create Trip")

    expect(Trip.all.count).to eq(1)
    expect(page).to have_current_path("/trips/1")
    expect(page).to have_content("Start Station: squeevillia")
    expect(page).to have_content("Bike ID: 500")
    
  end
end