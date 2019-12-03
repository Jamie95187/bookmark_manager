require 'pg'

class Bookmark
  def self.all
    database = ENV['ENVIRONMENT'] == 'test' ? 'bookmark_manager_test' : 'bookmark_manager'
    con = PG.connect(dbname: database, user: ENV['USER'])
    rows = con.exec('SELECT * FROM bookmarks')
    rows.map { |row| row['url'] }
  end
end
