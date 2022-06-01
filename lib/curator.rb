class Curator
  attr_reader :photographs, :artists

  def initialize
    @photographs = []
    @artists = []
  end

  def add_photograph(photo)
    @photographs << photo
  end

  def add_artist(artist)
    @artists << artist
  end

  def find_artist_by_id(id)
    @artists.find {|artist| artist.id == id}
  end

  def photographs_by_artist
    photo_hash = {}
      @artists.map do |artist|
        photo_hash[artist] = @photographs.select {|photo|photo.artist_id == artist.id}
      end
      return photo_hash
  end

  def artists_with_multiple_photographs
    photographs_by_artist
      what_we_want = []
      photographs_by_artist.each do |key, value|
        if value.count > 1
          what_we_want << key.name
        end
      end
      what_we_want
  end

  def photographs_taken_by_artist_from(country)
      photographs_by_artist
      what_we_want = []
      photographs_by_artist.find_all do |key, value|
        if key.country == country
          what_we_want << value
        end
      end
      what_we_want.flatten
  end



end
