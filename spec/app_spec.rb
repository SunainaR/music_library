require_relative '../app.rb'

# Print string for asking for user input
    # gets the user input for options: 1) view all 2) view one 3) insert 4) update 5) delete
      #  Promptms user for second input depending on option
      # runs one through repository class
      # returns response or records to screen

describe Application do
=begin
  it "tests the puts and gets for all options for the user selection" do
    album_repo = double (:AlbumRepository)
    io = double :io
    expect(io).to receive(:puts).with("Select your option for albums by typing the number:")
    expect(io).to receive(:puts).with("1) View all")
    expect(io).to receive(:puts).with("2) View one")
    expect(io).to receive(:puts).with("3) Insert one")
    expect(io).to receive(:puts).with("4) Update one")
    expect(io).to receive(:puts).with("5) Delete one")
    expect(io).to receive(:gets).and_return("1")
    expect(io).to receive(:puts).with("You chose 1")
    app = Application.new('music_library_test', io, album_repo)
    app.run
  end
=end
it "tests the puts and gets for all options for the user selection" do
  album_repo = double (:AlbumRepository)
  io = double :io
  expect(io).to receive(:puts).with("Welcome to the music library manager!\n\n")
  expect(io).to receive(:puts).with("What would you like to do?")
  expect(io).to receive(:puts).with("1 - List all albums")
  expect(io).to receive(:puts).with("2 - List all artists\n\n")
  expect(io).to receive(:puts).with("Enter your choice:")
  expect(io).to receive(:gets).and_return("1")
  app = Application.new('music_library_test', io, album_repo)
  result = app.run
end



end
