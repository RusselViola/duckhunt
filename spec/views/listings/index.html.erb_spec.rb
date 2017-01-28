require 'rails_helper'

xfeature "visits listings/index:" do
  let!(:listing1) { FactoryGirl.create(:listing) }
  let!(:listing2) { FactoryGirl.create(:listing) }
  let!(:listing3) { FactoryGirl.create(:listing) }

  scenario "it shows a list of listings" do
    visit root_path

    expect(page).to have_content(listing1.name)
    expect(page).to have_content(listing1.price)
    expect(page).to have_content(listing2.name)
    expect(page).to have_content(listing2.price)
    expect(page).to have_content(listing3.name)
    expect(page).to have_content(listing3.price)
  end
end
