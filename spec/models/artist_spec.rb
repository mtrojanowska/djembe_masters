require 'rails_helper'

RSpec.describe Artist, type: :model do
  context 'validation tests' do
    it 'checks artist\'s attributes presence' do
      artist = build(:artist)
      all_attributes_validation = artist.valid?
      expect(all_attributes_validation).to be true
    end

    it 'checks artist\'s nickname absence' do
      artist = build(:artist, nickname: '')
      nickname_validation = artist.valid?
      expect(artist.errors[:nickname][0]).to eq("can't be blank")
      # nickname_validation = artist.valid?
      # expect(nickname_validation).to be false
    end

    it 'checks the uniqueness of nickname' do
      artist = create(:artist)
      artist2 = build(:artist, nickname: "jajo")
      # nickname_validation = artist2.valid?
      # expect(nickname_validation).to be false
      # expect(artist2.errors[:nickname].first).to eq("has already been taken")
      # expect(artist2.persisted?).to eq false
      expect{artist2.save}.not_to change(Artist,:count)
    end

    it "checks the absence of birthdate" do
      artist = build(:artist, birthdate: '')
      origin_validation = artist.valid?
      expect(origin_validation).to be false
    end

    it "checks the absence of origin" do
      artist = build(:artist, origin: '')
      origin_validation = artist.valid?
      expect(origin_validation).to be false
    end

    it "checks the bio length is too short" do
      artist = build(:artist, biography: "lskdfjsl")
      origin_validation = artist.valid?
      expect(origin_validation).to be false
    end
  end
end
