# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first

require 'ffaker'

artists = []
5.times do
  artists << Artist.create(
    nickname: FFaker::Name.name,
    birthdate: FFaker::Time.date,
    origin: FFaker::Address.country,
    biography: FFaker::LoremPL.paragraph
  )
end

song1 = Song.create(title: 'First song', released: '03-03-1999', duration: '4 min', artist_id: artists[-1].id)
song2 = Song.create(title: 'Second song', released: '03-03-1999', duration: '4 min', artist_id: artists[-1].id)
song3 = Song.create(title: 'Third song', released: '12-12-1999', duration: '10 min', artist_id: artists[-1].id)
song4 = Song.create(title: 'Fourth song', released: '11-01-2000', duration: '25 min', artist_id: artists[-1].id)
