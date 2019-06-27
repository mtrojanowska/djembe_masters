# frozen_string_literal: true

class Artist < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :songs, dependent: :destroy

  validates :nickname, presence: true
  validates :nickname, uniqueness: { case_sensitive: false }
  validates :birthdate, presence: true
  validate :birthdate_in_the_future, if: :birthdate
  validates :origin, presence: true
  validates :biography, presence: true, length: { minimum: 250 }

  def birthdate_in_the_future
    errors.add(:birthdate, "can't be in the future") if birthdate > Date.today
  end
end
