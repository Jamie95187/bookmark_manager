feature 'Update existing bookmark' do
  scenario 'Allowed to update bookmark after adding a bookmark' do
    bookmark = Bookmark.create(url: 'https://www.twitter.com',title: 'Twitter')
    visit '/bookmarks'
    expect(page).to have_link('Twitter', href: 'https://www.twitter.com')

    first('.bookmark').click_button 'Edit'
    expect(current_path).to eq "/bookmarks/#{bookmark.id}/edit"

    fill_in 'URL', with: 'https://www.instagram.com'
    fill_in 'title', with: 'Instagram'
    click_button 'Update'

    expect(current_path).to eq '/bookmarks'
    expect(page).not_to have_link('Twitter', href: 'https://www.twitter.com')
    expect(page).to have_link('Instagram', href: 'https://www.instagram.com')
  end
end
