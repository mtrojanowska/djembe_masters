class Artist < ApplicationRecord

  validates :nickname, presence: true
  validates :nickname, uniqueness: {case_sensitive: false}
  validates :birthdate, presence: true
  validates :origin, presence: true
  validates :biography, presence: true, length: { minimum: 250 }
end
