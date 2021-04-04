module SignInSupport
  def access_sign_in_page(_user)
    visit root_path
    expect(page).to have_content('ログイン')
    visit new_user_session_path
  end
end
