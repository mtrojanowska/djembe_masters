# frozen_string_literal: true

class Song < ApplicationRecord
  belongs_to :artist
  validates :title, presence: true, uniqueness: true
  validates :released, presence: true
  validate :future_release_time, if: :released
  validate :past_release_time, if: :released
  validates :duration, presence: true
end

def future_release_time
  errors.add(:released, 'is the future date') if released > Time.now
end

def past_release_time
  first_record = 1929
  released_year = released.year
  if released_year < first_record
    errors.add(:released, '- too early for records')
  end
end
