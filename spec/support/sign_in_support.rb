module SignInSupport
  def access_sign_in_page(_user)
    visit root_path
    expect(page).to have_content('ログイン')
    visit new_user_session_path
  end

  def sign_in(user)
    access_sign_in_page(user)
    fill_in 'user[email]', with: user.email
    fill_in 'user[password]', with: user.password
    click_on('ログイン')
    expect(current_path).to eq(root_path)
  end
end
