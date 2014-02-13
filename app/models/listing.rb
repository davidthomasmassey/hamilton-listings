class Listing < ActiveRecord::Base
  validates_presence_of  :genre
  validates_inclusion_of :genre, in: %w( music art )

  before_validation :normalize_genre

  private
    def normalize_genre
      self.genre = genre.to_s.downcase
    end
end
