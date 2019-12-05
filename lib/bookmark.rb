require 'pg'

class Bookmark

  def self.all
    database = ENV['ENVIRONMENT'] == 'test' ? 'bookmark_manager_test' : 'bookmark_manager'
    con = PG.connect(dbname: database, user: ENV['USER'])
    rows = con.exec('SELECT * FROM bookmarks')
    rows.map do |row|
      p "#{row['title']}: #{row['url']}"
    end
  end

  def self.create(url:, title:)
    database = ENV['ENVIRONMENT'] == 'test' ? 'bookmark_manager_test' : 'bookmark_manager'
    con = PG.connect(dbname: database, user: ENV['USER'])
    con.exec("INSERT INTO bookmarks (url, title) VALUES('#{url}', '#{title}');")
  end

end
