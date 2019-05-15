class Song < ApplicationRecord
  validates :title, presence: true, uniqueness: true
  validates :released, presence: true
  validates :duration, presence: true
end
