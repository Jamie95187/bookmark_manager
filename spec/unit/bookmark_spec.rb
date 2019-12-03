require 'bookmark'
require 'pg'

describe Bookmark do
  let(:db) { double :db, exec: [ {'id' => '1', 'url' => 'https://www.google.com'},
               {'id' => '2', 'url' => 'https://www.destroyallsoftware.com'},
               {'id' => '3', 'url' => 'https://www.makersacademy.com'} ] }
  let(:database) { { dbname: 'bookmark_manager', user: ENV['USER'] } }
  describe '.all' do

    before do
      allow(PG).to receive(:connect).with(database).and_return(db)
    end

    it 'connects to a database' do
      expect(PG).to receive(:connect).with(database)
      Bookmark.all
    end

    it 'makes a query to retrieve all the urls' do
      expect(PG.connect(database)).to receive(:exec).with('SELECT * FROM bookmarks')
      Bookmark.all
    end

    it 'returns all bookmarks' do
      bookmarks = Bookmark.all

      expect(bookmarks).to include("https://www.google.com")
      expect(bookmarks).to include("https://www.destroyallsoftware.com")
      expect(bookmarks).to include("https://www.makersacademy.com")
    end

  end
end
