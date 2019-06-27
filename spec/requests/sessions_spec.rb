require 'rails_helper'

RSpec.describe "Sessions" do
  it "signs artist in" do
    artist = create(:artist)
    artits = Artist.create(email: 'test@test.com', password: "password", password_confirmation: "password")
    sign_in artist
    get artist_path(artist)
    expect(response).to be_successful
end
it "signs artist out" do
  artist = create(:artist)
  artits = Artist.create(email: 'test@test.com', password: "password", password_confirmation: "password")
  sign_in artist
    sign_out artist
    get root_path
    expect(response).to render_template(:index)
  end
end
