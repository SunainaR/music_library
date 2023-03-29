require 'album_repository'

def reset_books_table
  seed_sql = File.read('spec/seeds_albums.sql')
  connection = PG.connect({ host: '127.0.0.1', dbname: 'book_store_test' })
  connection.exec(seed_sql)
end

describe AlbumRepository do
  it "adds an album to the array"
      repository = AlbumRepository.new
      album = Album.new
      album.title = 'Trompe le Monde'
      album.release_year = 1991
      album.artist_id = 1
      repository.create(album)
      all_albums = repository.all
      expect(all_albums).to include(album)
end

# The all_albums array should contain the new Album object