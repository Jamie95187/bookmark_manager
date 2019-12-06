feature 'Click title URL' do
  scenario 'Should take user to the webpage that the bookmark is saved under' do

    connection = PG.connect(dbname:'bookmark_manager_test')
    visit('/')
    click_button 'Submit'
    fill_in 'URL', with: 'https://www.google.com'
    fill_in 'title', with: 'Google'
    click_button 'Submit'
    click_link 'Google'
    expect(page).to have_content "I'm Feeling Lucky"
  end
end
