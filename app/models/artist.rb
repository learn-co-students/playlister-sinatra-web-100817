class Artist < ActiveRecord::Base
  include Slugifiable::Slug
  extend Slugifiable::FindBySlug
  has_many :songs
  has_many :song_genres, through: :songs
  has_many :genres, through: :song_genres
end