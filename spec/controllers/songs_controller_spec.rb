require 'rails_helper'

RSpec.describe SongsController, type: :controller do
  describe "GET #index" do
    it "checks index functionality" do
      song1 = create(:song)
      song2 = create(:song, title: "Some title")
      song3 = create(:song, title: "Some other title")
      get :index
      expect(assigns(:songs)).to eq([song1, song2, song3])
    end

    it "renders the index template" do
      get :index
      expect(response).to render_template :index
    end
  end

  describe "GET #show" do
    it "assigns song to @song" do
      song = create(:song)
      get :show, params: { id: song.id }
      expect(assigns(:song)).to eq(song)
    end

    it "renders the show template" do
      song = create(:song)
      get :show, params: { id: song.id }
      expect(response). to render_template :show
    end
  end

  describe "GET #new" do
    it "returns a success response" do
      get :new
      expect(assigns(:song)).to be_a_new(Song)
    end

    it "renders the new template" do
      get :new
      expect(response).to render_template :new
    end
  end

  describe "GET #edit" do
    it "assigns requested song to @song" do
      song = create(:song)
      get :edit, params: { id: song.id }
      expect(assigns(:song)).to eq(song)
    end

    it "renders the edit template" do
      song = create(:song)
      get :edit, params: { id: song.id }
      expect(response).to render_template :edit
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Song" do
        expect do
          post :create, params: { song: attributes_for(:song)}
        end.to change(Song, :count).by(1)
       end


      it "redirects to the @song" do
        post :create, params: { song: attributes_for(:song) }
        expect(response).to redirect_to(Song.last)
      end
    end

    context "with invalid params" do
      it "returens a new template" do
        post :create, params: { song: attributes_for(:song, title: '')}
        expect(response).to render_template :new
      end
    end
  end

    describe "PUT #update" do
      context "with valid params" do
        it "updates the song" do
          song = create(:song)
          put :update, params: { id: song.id, song: attributes_for(:song, title: "The ears") }
          song.reload
          expect(assigns(:song).title).to eq("The ears")
        end

        it "redirects to the @song" do
          song = create(:song)
          put :update, params: { id: song.id, song: attributes_for(:song, title: "The ears") }
          expect(response).to redirect_to(song_path(song))
      end
    end

    context "with invalid params" do
        it "renders the update template" do
          song = create(:song)
          put :update, params: { id: song.id, song: attributes_for(:song, title: '') }
          expect(response).to render_template :new
        end
      end

      describe "DELETE #destroy" do
        context "destroys the song" do
          it "destroys the @song" do
            song1 = create(:song)
            song2 = create(:song, title: "Some title")
            song3 = create(:song, title: "Some other title")
            expect do
              delete :destroy, params: { id: song2.id}
            end.to change(Song, :count).by (-1)
          end

          it "redirects to songs" do
            song1 = create(:song)
            song2 = create(:song, title: "Some title")
            song3 = create(:song, title: "Some other title")
            delete :destroy, params: { id: song2.id}
            expect(response).to redirect_to(songs_path)
          end
        end
      end
    end
  end
