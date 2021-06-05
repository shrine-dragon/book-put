module MyPageSupport
  def have_my_page_info(user, questionnaire)
    expect(page).to have_content(user.nickname && user.gender.name && user.birth_day && user.email)
    expect(page).to have_content(questionnaire.category.name && questionnaire.genre.name && questionnaire.purchase_place.name && questionnaire.reading_media.name)
    expect(page).to have_selector("img[src$='test_image.png']" && ".book-posted-time")
    expect(page).to have_content(@book.title)
  end

  def edit_action(user)
    sign_in(user)
    expect(page).to have_content(user.nickname)
    click_on(user.nickname)
    expect(current_path).to eq(user_path(user.id))
    expect(page).to have_content(user.nickname && user.gender.name && user.birth_day && user.email)
    find('#ellipsis-btn').click
    expect(page).to have_link '編集', href: edit_user_path(user.id)
    click_on('編集')
    expect(current_path).to eq(edit_user_path(user.id))
    expect(
      find('#nickname').value
    ).to eq(user.nickname)
    expect(
      find('#user-gender').value
    ).to eq(user.gender_id.to_s)
    expect(
      find('#email').value
    ).to eq(user.email)
  end

  def have_no_info
    expect(page).to have_no_content(".user-nickname")
    expect(page).to have_no_selector("#user-image")
  end
end