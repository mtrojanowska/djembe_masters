FactoryBot.define do
  factory :artist do
    nickname {FFaker::Name.name}
    birthdate {'12-11-1986'}
    origin {FFaker::Address.country}
    biography {FFaker::LoremPL.paragraphs(3).join}
    email {FFaker::Internet.email}
    password {'password'}
    password_confirmation {'password'}
  end

end
