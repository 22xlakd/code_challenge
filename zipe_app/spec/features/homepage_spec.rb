require 'spec_frontend_helper'

describe "Homepage", type: :feature, js: true do
  before(:each) do
    page.driver.browser.manage.window.resize_to(1024,768)
    visit '/'
  end

  it "shows video list" do
    expect(page).to have_content("Listing Videos")
  end

  context "when user isn't logged in" do
    it "shows video if it doesn't require subscription" do
      expect(page).to have_content('Show')
      click_link '4'
      expect(page).not_to have_content('Login')
    end

    it "doesn't show a video wich requires subscription" do
      expect(page).to have_content('Show')
      click_link '3'
      expect(page).to have_content('Login')
    end
  end

  context "when user is logged in" do
    it "allows user watch video wich requires subscription" do
      expect(page).to have_content('Show')
      click_link '3'
      expect(page).to have_content('Login')
      click_link 'Login'
      expect(page).to have_content('Log In')
      fill_in "username", with: "test@test.com"
      fill_in "password", with: "password"
      click_button 'Login'
      expect(page).to have_content('Logout')
      expect(page).not_to have_content('Login')
    end
  end

end
