module SignUpSupport
  def access_sign_up_page(user)
    visit root_path
    expect(page).to have_content('新規登録')
    visit new_user_registration_path
  end

  def input_user_info(user)
    fill_in 'user[nickname]', with: @user.nickname
    select '男性', from: 'user[gender_id]'
    select '1930', from: 'user[birth_day(1i)]'
    select '1', from: 'user[birth_day(2i)]'
    select '1', from: 'user[birth_day(3i)]'
    fill_in 'user[email]', with: @user.email
    fill_in 'user[password]', with: @user.password
    fill_in 'user[password_confirmation]', with: @user.password_confirmation
    click_on('次へ進む')
    expect(page).to have_no_content('次へ進む')
  end
end
