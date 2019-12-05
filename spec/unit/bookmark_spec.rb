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
      con.exec("INSERT INTO bookmarks (url) VALUES('https://www.google.com');")
      con.exec("INSERT INTO bookmarks (url) VALUES('https://www.destroyallsoftware.com');")
      con.exec("INSERT INTO bookmarks (url) VALUES('https://www.makersacademy.com');")

      bookmarks = Bookmark.all

      expect(bookmarks).to include("https://www.google.com")
      expect(bookmarks).to include("https://www.destroyallsoftware.com")
      expect(bookmarks).to include("https://www.makersacademy.com")
    end

  end
end
