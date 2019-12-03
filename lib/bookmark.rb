require 'pg'

class Bookmark
  def self.all
    con = PG.connect(dbname: 'bookmark_manager', user: ENV['USER'])
    rows = con.exec('SELECT * FROM bookmarks')
    rows.map { |entry| entry['url'] }
  end
end
