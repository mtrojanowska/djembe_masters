# frozen_string_literal: true

class Song < ApplicationRecord
  validates :title, presence: true, uniqueness: true
  validate :future_release_time
  validate :past_release_time
  validates :released, presence: true
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
