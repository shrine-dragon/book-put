module PostSupport
  def access_new_post_page(user)
    sign_in(user)
    expect(page).to have_content('投稿する')
    visit new_book_path
  end

  def access_post_detail_page(book)
    expect(page).to have_content(book.title)
    expect(page).to have_selector(".book-posted-user" && ".book-posted-time")
    visit book_path(book.id)
    expect(page).to have_content(book.title && book.catch_copy && book.content && book.highlight)
    expect(page).to have_selector(".detail-category-genre")
  end
end