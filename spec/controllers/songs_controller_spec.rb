require 'rails_helper'

RSpec.describe SongsController, type: :controller do

  describe "GET #index" do
    it "checks index functionality" do
      artist = create(:artist)
      song1 = create(:song, artist_id: artist.id)
      song2 = create(:song, title: "Some title", artist_id: artist.id)
      song3 = create(:song, title: "Some other title", artist_id: artist.id)
      get :index, params: { artist_id: artist.id }
      expect(response).to be_success
    end
  end

  describe "GET #show" do
    it "assigns song to @song" do
      artist = create(:artist)
      song = create(:song, artist_id: artist.id)
      get :show, params: { id: song.id, artist_id: artist.id }
      expect(artist.songs.first).to eq(song)
    end


  describe "GET #new" do
    it "returns a success response" do
      artist = create(:artist)
      get :new, params: { artist_id: artist.id }
      expect(assigns(:song)).to be_a_new(Song)
    end

    it "renders the new template" do
      artist = create(:artist)
      get :new, params: { artist_id: artist.id }
      expect(response).to render_template :new
    end
  end

  describe "GET #edit" do
    it "assigns requested song to @song" do
      artist = create(:artist)
      song = create(:song, artist_id: artist.id)
      get :edit, params: { id: song.id, artist_id: artist.id }
      expect(assigns(:song)).to eq(song)
    end

    it "renders the edit template" do
      artist = create(:artist)
      song = create(:song, artist_id: artist.id)
      get :edit, params: { id: song.id, artist_id: artist.id }
      expect(response).to render_template :edit
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Song" do
        artist = create(:artist)
        expect do
          post :create, params: { song: attributes_for(:song), artist_id: artist.id }
        end.to change(Song, :count).by(1)
      end


      it "redirects to the @song" do
        artist = create(:artist)
        post :create, params: { song: attributes_for(:song), artist_id: artist.id }
        expect(response).to redirect_to(artist_path(artist))
      end
    end

     context "with invalid params" do
      it "returns a new template" do
        artist = create(:artist)
        post :create, params: { song: attributes_for(:song, title: ''), artist_id: artist.id }
        expect(response).to render_template :new
      end
    end
  end

    describe "PUT #update" do
      context "with valid params" do
        it "updates the song" do
          artist = create(:artist)
          song = create(:song, artist_id: artist.id)
          put :update, params: { id: song.id, song: attributes_for(:song, title: "The ears"), artist_id: artist.id }
          artist.songs.reload
          expect(artist.songs.first.title).to eq("The ears")
        end

        it "redirects to the @song" do
          artist = create(:artist)
          song = create(:song, artist_id: artist.id)
          put :update, params: { id: song.id, song: attributes_for(:song, title: "The ears"), artist_id: artist.id }
          expect(response).to redirect_to(artist_path(artist))
      end
    end

    context "with invalid params" do
        it "renders the update template" do
          artist = create(:artist)
          song = create(:song, artist_id: artist.id)
          put :update, params: { id: song.id, song: attributes_for(:song, title: ''), artist_id: artist.id }
          expect(response).to render_template :edit
        end
      end
    end


    describe "DELETE #destroy" do
        context "destroys the song" do
          it "destroys the @song" do
            artist = create(:artist)
            song1 = create(:song, artist_id: artist.id)
            song2 = create(:song, title: "Some title", artist_id: artist.id)
            song3 = create(:song, title: "Some other title", artist_id: artist.id)
            expect do
              delete :destroy, params: { id: song2.id, artist_id: artist.id}
            end.to change(Song, :count).by (-1)
          end

          it "redirects to songs" do
            artist = create(:artist)
            song1 = create(:song, artist_id: artist.id)
            song2 = create(:song, title: "Some title", artist_id: artist.id)
            song3 = create(:song, title: "Some other title", artist_id: artist.id)
            delete :destroy, params: { id: song2.id, artist_id: artist.id}
            expect(response).to redirect_to(artist_path(artist))
          end

        end

      end
   end
end
