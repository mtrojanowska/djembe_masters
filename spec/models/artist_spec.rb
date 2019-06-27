# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Artist, type: :model do

  context 'authentication' do
    it "checks the signup parameters" do
      artist = create(:artist)


      expect(assigns(:artist)).to be true
    end
end

  context 'validation tests' do
    it 'checks artist\'s attributes presence' do
      artist = build(:artist)
      all_attributes_validation = artist.valid?
      expect(all_attributes_validation).to be true
    end

    it 'checks artist\'s nickname absence' do
      artist = build(:artist, nickname: '')
      artist.valid?
      expect(artist.errors[:nickname][0]).to eq("can't be blank")
    end

    it 'checks the uniqueness of nickname' do
      artist = create(:artist, nickname: 'Jajo')
      artist2 = build(:artist, nickname: 'Jajo')
      expect { artist2.save }.not_to change(Artist, :count)
    end

    it 'checks the absence of birthdate' do
      artist = build(:artist, birthdate: '')
      origin_validation = artist.valid?
      expect(origin_validation).to be false
    end

    it 'checks the absence of origin' do
      artist = build(:artist, origin: '')
      origin_validation = artist.valid?
      expect(origin_validation).to be false
    end

    it 'checks the bio length is too short' do
      artist = build(:artist, biography: 'lskdfjsl')
      origin_validation = artist.valid?
      expect(origin_validation).to be false
    end
  end
end
