# frozen_string_literal: true

FactoryBot.define do
  factory :artist do
    nickname { 'Jajo' }
    birthdate { 'Dec 8 1974' }
    origin { 'Nigeria' }
    biography do
      "Paoi sdafi fj fjhasfjhsdjfh sjfsjhfsdh f
               ausdufhlf ufh aufhjkhdflahfjdhfjdhfjhalsjdf
               afysdaufydsufyh udhfdsjfhljsdkhfsjadhfjshfa
               afh kjdhf jhfkjdhfajshfjkdshfljhflajdfhlajkdhf
               asdjfhjkfhjfhaljfhajdhfldkjshfjdhfjsksh
               ajfdh jfh lajkhsdlfjh ljkha lsdjkhf lkjhasdf"
    end
  end
end
