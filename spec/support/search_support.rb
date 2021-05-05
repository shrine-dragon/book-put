module SearchSupport
  def find_search_form 
    visit root_path
    expect(page).to have_selector(".search-form")
  end
end