require 'bookmark'
require 'pg'

describe Bookmark do
  let(:con) { PG.connect test_database }
  let(:test_database) { { dbname: 'bookmark_manager_test', user: ENV['USER'] } }

  describe '.all' do
    it 'makes a query to retrieve all the urls' do
      expect(con).to receive(:exec).with('SELECT * FROM bookmarks')
      p con.exec 'SELECT * FROM bookmarks'
      Bookmark.all
    end

    it 'returns all bookmarks' do
      # Add test data
      con.exec("INSERT INTO bookmarks (url, title) VALUES('https://www.google.com', 'Google');")
      con.exec("INSERT INTO bookmarks (url, title) VALUES('https://www.destroyallsoftware.com', 'Destroy Software');")
      con.exec("INSERT INTO bookmarks (url, title) VALUES('https://www.makersacademy.com', 'Makers');")

      bookmarks = Bookmark.all

      expect(bookmarks).to include("Google: https://www.google.com")
      expect(bookmarks).to include("Destroy Software: https://www.destroyallsoftware.com")
      expect(bookmarks).to include("Makers: https://www.makersacademy.com")
    end

  end
end
