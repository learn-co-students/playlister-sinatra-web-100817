class Song < ActiveRecord::Base
  include Slugifiable::Slug
  extend Slugifiable::FindBySlug
  belongs_to :artist
  has_many :song_genres
  has_many :genres, through: :song_genres
end