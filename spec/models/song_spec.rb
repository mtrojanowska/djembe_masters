# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Song, type: :model do
  context 'validation tests' do
    it "checks song\'s attributes presence" do
      song = build(:song)
      expect { song.save }.to change(Song, :count)
    end

    it "checks song\'s title absence" do
      song = build(:song, title: '')
      expect(song.valid?).to be false
    end

    it 'checks the uniqueness of title' do
      song = create(:song, title: "The hooves")
      song2 = build(:song, title: 'The hooves')
      expect{ song2.save }.not_to change(Song, :count)
    end

    it 'checks the absence of date' do
      song = build(:song, released: '')
      expect(song.valid?).to be false
    end

    it 'checks the absence of duration' do
      song = build(:song, duration: '')
      song.validate
      expect(song.errors[:duration].first).to eq("can't be blank")
    end
  end
end
