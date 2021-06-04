module MyPageSupport
  def have_my_page_info(user, questionnaire)
    expect(page).to have_content(user.nickname && user.gender.name && user.birth_day && user.email)
    expect(page).to have_content(questionnaire.category.name && questionnaire.genre.name && questionnaire.purchase_place.name && questionnaire.reading_media.name)
    expect(page).to have_selector("img[src$='test_image.png']" && ".book-posted-time")
    expect(page).to have_content(@book.title)
  end
end