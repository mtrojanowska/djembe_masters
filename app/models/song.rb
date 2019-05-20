class Song < ApplicationRecord
  validates :title, presence: true, uniqueness: true
  DATE_REGEX = /\A\d{4}-\d{2}-\d{2}\z/
  validates :released, presence: true, format: { with: DATE_REGEX }
  validates :duration, presence: true
end
