module SearchSupport
  def find_search_form
    visit root_path
    expect(page).to have_selector(".search-form")
  end

  def move_to_search_books_path
    find(".search-button").click
    expect(current_path).to eq search_books_path
  end
end