require 'rails_helper'

RSpec.describe Song, type: :model do
  context "validation tests" do
    it "checks song\'s attributes presence" do
      song = build(:song)
      all_valid_attributes = song.valid?
      expect(all_valid_attributes).to be true
    end

    it "checks song\'s title absence" do
      song = build(:song, title: '')
      expect(song.persisted?).to eq false
    end

    it "checks the uniqueness of title" do
      song = create(:song)
      song2 = build(:song, title: "The hooves")
      expect{song2.save}.not_to change(Song, :count)
    end

    it "checks the absence of date" do
      song = build(:song, duration: '')
      duration_validation = song.valid?
      expect(duration_validation).to eq false
    end

    it "checks the absence of duration" do
      song = build(:song, duration: '')
      duration_validation = song.valid?
      expect(song.errors[:duration].first).to eq("can't be blank")
    end
  end
end
ongs
