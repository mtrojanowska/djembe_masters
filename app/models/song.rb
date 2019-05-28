
class Song < ApplicationRecord

  validates :title, presence: true, uniqueness: true

  validate :future_release_time
  validate :past_release_time
  validates :released, presence: true

  validates :duration, presence: true
end

    def future_release_time
      if released > Time.now
      errors.add(:released, "is the future date")
    end
  end

  def past_release_time
    today = Date.today
    current_year = today.year
    released_year = released.year
    if released_year < current_year - 90
      errors.add(:released, "- too early for records")
    end
  end
