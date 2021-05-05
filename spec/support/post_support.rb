module PostSupport
  def access_new_post_page(user)
    sign_in(user)
    expect(page).to have_content('投稿する')
    visit new_book_path
  end
end