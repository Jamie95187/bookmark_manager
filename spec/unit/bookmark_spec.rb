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
  end

    it 'returns all bookmarks' do

      bookmark = Bookmark.create(url: "https://www.google.com", title: "Google")
      Bookmark.create(url: "https://www.destroyallsoftware.com", title: "Destroy Software")
      Bookmark.create(url: "https://www.makersacademy.com", title: "Makers")

      bookmarks = Bookmark.all

      expect(bookmarks.length).to eq 3
      expect(bookmarks.first).to be_a Bookmark
      expect(bookmarks.first.id).to eq bookmark.id
      expect(bookmarks.first.title).to eq 'Google'
      expect(bookmarks.first.url).to eq 'https://www.google.com'
  end

  describe '.create' do
    it 'creates a new bookmark' do
     bookmark = Bookmark.create(url: 'www.google.com', title: 'Google').first

     expect(bookmark['url']).to eq 'www.google.com'
     expect(bookmark['title']).to eq 'Google'
   end
  end

end
