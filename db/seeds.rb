# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first
# Artist.destroy_all
artist1 = Artist.create(nickname: 'Jajo', birthdate: '12-12-1978', origin: 'Goa', biography: "Lorem ipsum dolor sit amet,
                                                                                      consectetur adipiscing elit. Sed
                                                                                      sodales accumsan velit. Pellentesque
                                                                                      lobortis, sapien et commodo gravida,
                                                                                      diam velit aliquam enim, et rutrum
                                                                                      arcu ante vitae est. Aenean nec risus
                                                                                      eget lorem volutpat luctus. Etiam mattis
                                                                                      rutrum urna ut volutpat. Donec pellentesque
                                                                                      venenatis odio, vitae dignissim libero
                                                                                      bibendum sed. Aliquam erat volutpat. Cras
                                                                                      sit amet tortor a lorem commodo commodo a ut quam.
                                                                                      Donec ut suscipit magna, vitae vulputate erat.
                                                                                      Fusce rutrum metus in est volutpat, ornare rhoncus
                                                                                      sem sodales. Nunc ullamcorper ultricies commodo.
                                                                                      Curabitur eget lectus at ipsum dapibus volutpat
                                                                                       eget id dolor. Donec eget nisl felis. Duis.")
artist2 = Artist.create(nickname: 'Jabba', birthdate: '01-01-1956', origin: 'Kongo', biography: "Lorem ipsum dolor sit amet,
                                                                          consectetur adipiscing elit. Sed
                                                                          sodales accumsan velit. Pellentesque
                                                                          lobortis, sapien et commodo gravida,
                                                                          diam velit aliquam enim, et rutrum
                                                                          arcu ante vitae est. Aenean nec risus
                                                                          eget lorem volutpat luctus. Etiam mattis
                                                                          rutrum urna ut volutpat. Donec pellentesque
                                                                          venenatis odio, vitae dignissim libero
                                                                          bibendum sed. Aliquam erat volutpat. Cras
                                                                          sit amet tortor a lorem commodo commodo a ut quam.
                                                                          Donec ut suscipit magna, vitae vulputate erat.
                                                                          Fusce rutrum metus in est volutpat, ornare rhoncus
                                                                          sem sodales. Nunc ullamcorper ultricies commodo.
                                                                          Curabitur eget lectus at ipsum dapibus volutpat
                                                                           eget id dolor. Donec eget nisl felis. Duis.")
artist3 = Artist.create(nickname: 'Ubu', birthdate: '12-09-1987', origin: 'RPA', biography: "Lorem ipsum dolor sit amet,
                                                                      consectetur adipiscing elit. Sed
                                                                      sodales accumsan velit. Pellentesque
                                                                      lobortis, sapien et commodo gravida,
                                                                      diam velit aliquam enim, et rutrum
                                                                      arcu ante vitae est. Aenean nec risus
                                                                      eget lorem volutpat luctus. Etiam mattis
                                                                      rutrum urna ut volutpat. Donec pellentesque
                                                                      venenatis odio, vitae dignissim libero
                                                                      bibendum sed. Aliquam erat volutpat. Cras
                                                                      sit amet tortor a lorem commodo commodo a ut quam.
                                                                      Donec ut suscipit magna, vitae vulputate erat.
                                                                      Fusce rutrum metus in est volutpat, ornare rhoncus
                                                                      sem sodales. Nunc ullamcorper ultricies commodo.
                                                                      Curabitur eget lectus at ipsum dapibus volutpat
                                                                       eget id dolor. Donec eget nisl felis. Duis.")
song1 = Song.create(title: 'First song', released: '02-02-1999', duration: '14 min', artist_id: artist1.id)
song2 = Song.create(title: 'Second song', released: '03-03-1999', duration: '4 min', artist_id: artist1.id)
song3 = Song.create(title: 'Third song', released: '12-12-1999', duration: '10 min', artist_id: artist2.id)
song4 = Song.create(title: 'Fourth song', released: '11-01-2000', duration: '25 min', artist_id: artist3.id)
