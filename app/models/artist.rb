class Artist < ApplicationRecord

  validates :nickname, presence: true
  validates :nickname, uniqueness: {case_sensitive: false}
  validates :birthdate, presence: true
  validate :birthdate_in_the_future
  validates :origin, presence: true
  validates :biography, presence: true, length: { minimum: 250 }
end


def birthdate_in_the_future
  if birthdate > Date.today
    errors.add(:birthdate, "can't be in the future")
  end
end
