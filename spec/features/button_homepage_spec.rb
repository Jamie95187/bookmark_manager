feature 'Send to add page' do
  scenario 'A user can click a link that sends to the add page' do
    visit('/')
    click_button 'Submit'
    expect(page).to have_content "Input a favourite bookmakr URL"
  end
end
