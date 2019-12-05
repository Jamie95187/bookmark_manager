require 'pg'

feature 'Viewing bookmarks' do
  scenario 'A user can see bookmarks' do
    connection = PG.connect(dbname: 'bookmark_manager_test')

    # Add the test data
    connection.exec("INSERT INTO bookmarks(url, title) VALUES('https://www.makersacademy.com', 'Makers');")
    connection.exec("INSERT INTO bookmarks(url, title) VALUES('https://www.destroyallsoftware.com', 'Destroy Software');")
    connection.exec("INSERT INTO bookmarks(url, title) VALUES('https://www.google.com', 'Google');")

    visit('/bookmarks')

    expect(page).to have_link("Makers", href: 'https://www.makersacademy.com')
    expect(page).to have_link("Destroy Software", href: 'https://www.destroyallsoftware.com')
    expect(page).to have_link("Google", href: 'https://www.google.com')

  end
end
