require 'album_repository'

def reset_albums_table
  seed_sql = File.read('spec/seeds_albums.sql')
  connection = PG.connect({ host: '127.0.0.1', dbname: 'music_library_test' })
  connection.exec(seed_sql)
end

describe AlbumRepository do
  before(:each) do
    reset_albums_table
  end

  it "adds an album to the database" do
      repository = AlbumRepository.new
      album = Album.new
      album.title = 'Trompe le Monde'
      album.release_year = 1991
      album.artist_id = 1
      repository.create(album)
      all_albums = repository.all
      expect(all_albums).to include(
        have_attributes(
          title: album.title,
          release_year: album.release_year,
          artist_id: album.artist_id
        )
      )
  end
  it "delete one album from the database" do
    repository = AlbumRepository.new
    id_to_delete = 1
    repository.delete(id_to_delete)
    all_albums = repository.all
    expect(all_albums.length).to eq 1
    expect(all_albums.first.id).to eq 2
  end

  it "updates one album from the database" do
    repository = AlbumRepository.new
    album = repository.find(1)
    album.title = 'New Name'
    album.release_year = 2000
    repository.update(album)
    updated_album = repository.find(1)
    expect(updated_album).to have_attributes(title: 'New Name', release_year: 2000)
  end


  it "find one album from the database" do
    repository  = AlbumRepository.new
    album = repository.find(1)
    expect(album.title).to eq "Cat Sisters"
    expect(album.release_year).to eq 2023
  end
end

# The all_albums array should contain the new Album object
