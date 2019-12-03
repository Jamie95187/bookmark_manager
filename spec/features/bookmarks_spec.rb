feature "bookmarks page" do
  scenario "shows the list bookmarks" do
    visit '/bookmarks'

    expect(page).to have_content "https://www.google.com"
    expect(page).to have_content "https://www.destroyallsoftware.com"
    expect(page).to have_content "https://www.makersacademy.com"
  end
end
