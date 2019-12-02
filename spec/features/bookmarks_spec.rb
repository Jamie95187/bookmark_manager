feature "bookmarks page" do
  scenario "shows the list bookmarks" do
    visit '/bookmarks'
    
    expect(page).to have_content "https://www.google.com"
    expect(page).to have_content "https://www.yahoo.com"
    expect(page).to have_content "https://www.youtube.com"
  end
end
