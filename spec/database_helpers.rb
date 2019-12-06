require 'pg'

def persisted_data(id:)
  connection = PG.connect(dbname: 'bookmark_manager_test')
  result = connection.query("SELECt * FROM bookmarks WHERE id = #{id};")
  result.first
end
