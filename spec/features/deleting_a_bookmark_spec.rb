feature 'Deleting a bookmark' do
  scenario 'Can delete a bookmark' do
    Bookmark.create(url: 'https://www.twitter.com',title: 'Twitter')
    visit '/bookmarks'
    expect(page).to have_link('Twitter', href: 'https://www.twitter.com')

    first('.bookmark').click_button 'Delete'

    expect(current_path).to eq '/bookmarks'
    expect(page).not_to have_link('Twitter', href: 'https://www.twitter.com')
  end
end
