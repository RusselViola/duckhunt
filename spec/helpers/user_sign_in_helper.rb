module UserSignInHelper
  def login_with_facebook(username = "partyboy5000")
    visit auth_path(:facebook)
    fill_in :user_name, with: username
    click_on "Create User"
  end
end
