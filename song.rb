class Song

  attr_reader :name, :author, :album, :genre

  def initialize(name,author,album,genre)
    @name=name
    @author=author
    @album=album
    @genre=genre
  end
end