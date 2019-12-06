feature 'Adding bookmarks' do
  scenario 'A user can add a bookmark to the database' do
    connection = PG.connect(dbname:'bookmark_manager_test')

    visit('/bookmarks/new')
    fill_in 'URL', with: 'https://www.google.com'
    fill_in 'title', with: 'Google'
    click_button 'Submit'
    expect(page).to have_link("Google", href: 'https://www.google.com')
  end
end
