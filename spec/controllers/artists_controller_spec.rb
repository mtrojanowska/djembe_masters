# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ArtistsController, type: :controller do
  describe 'GET #index' do
    it 'checks index functionality' do
      artist1 = create(:artist, nickname: "Jajo")
      artist2 = create(:artist, nickname: 'Jojo')
      get :index
      expect(assigns(:artists)).to eq([artist1, artist2])
    end

    it 'renders the index template' do
      get :index
      expect(response).to render_template :index
    end
  end

  describe 'GET #show' do
    it 'assigns requested artist to @artist' do
      artist = create(:artist)
      get :show, params: { id: artist.id }
      expect(assigns(:artist)).to eq(artist)
    end

    it 'renders the show template' do
      artist = create(:artist)
      get :show, params: { id: artist.id }
      expect(response).to render_template :show
    end
  end

  describe 'GET #new' do
    it 'returns a success response' do
      get :new
      expect(assigns(:artist)).to be_a_new(Artist)
    end

    it 'renders the new template' do
      get :new
      expect(response).to have_http_status "200"
    end
  end

  describe 'GET #edit' do
    it 'assigns requested artist to @artist' do
      artist = create(:artist)
      sign_in artist
      get :edit, params: { id: artist.id }
      expect(assigns(:artist)).to eq(artist)
    end

    it 'renders #edit template' do
      artist = create(:artist)
      sign_in artist
      get :edit, params: { id: artist.id }
      expect(response).to render_template :edit
    end
  end

  describe 'POST #create' do
    context 'with valid params' do
      it 'creates a new Artist' do
          expect do
          post :create, params: { artist: attributes_for(:artist)}
          end.to change(Artist, :count).by(1)
      end

      it 'redirects to the @artist' do
        expect do
        post :create, params: { artist: attributes_for(:artist)}
        end.to change(Artist, :count).by(1)
        expect(response).to have_http_status '302'
      end
    end

    context 'with invalid params' do
      it 'email and password is not enough' do
        expect do
        post :create, params: { artist: attributes_for(:artist, nickname: nil, birthdate: nil, origin: nil, biography: nil) }
        end.to_not change(Artist, :count)
        expect(response.code).to render_template :new
      end
    end

    describe "sessions POST #create" do
      it "logs in with valid params" do
        artist = create(:artist)
        sign_in artist
        expect(response).to have_http_status '200'
      end

      it "tries to log in with invalid params" do
        artist = create(:artist, attributes_for(:artist, email: "jaja@example.com", password: "password"))
        sign_in(build(:artist, attributes_for(:artist, email: "jaja@example.com", password: "somepassword")))
        expect(response).to redirect_to 'artists/sign_in'
       end
     end

    describe 'PUT #update' do
      context 'valid attributes' do
        it 'updates the requested artist' do
          artist = create(:artist)
          sign_in artist
          put :update, params: { id: artist.id, artist: attributes_for(:artist, email: 'jerry@example.com', current_password: "password") }
          expect(artist.reload.email).to eq('jerry@example.com')
        end

        it 'redirects to the artist' do
          artist = create(:artist)
          sign_in artist
          put :update, params: { id: artist.id, artist: attributes_for(:artist, nickname: 'Aaaartist') }
          expect(response).to redirect_to(artist_path(artist))
        end
      end

        context 'invalid attributes' do
          it 'updates the requested artits' do
            artist = create(:artist)
            sign_in artist
            put :update, params: { id: artist.id, artist: attributes_for(:artist, nickname: '') }
            expect(response).to render_template :new
          end



        describe 'DELETE #destroy' do
          it 'destroys the requested artist' do
            artist1 = create(:artist)
            artist2 = create(:artist, nickname: 'Jojo')
            artist3 = create(:artist, nickname: 'Boo')
            sign_in artist1
            expect do
              delete :destroy, params: { id: artist1.id }
            end.to change(Artist, :count).by(-1)
          end

          it 'redirects to the artists list' do
            artist1 = create(:artist)
            artist2 = create(:artist, nickname: 'Jojo')
            artist3 = create(:artist, nickname: 'Boo')
            sign_in artist1
              delete :destroy, params: { id: artist1.id }
            expect(response).to redirect_to '/artists'
          end
        end
      end
    end
  end
end
