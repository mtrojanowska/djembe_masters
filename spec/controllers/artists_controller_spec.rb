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
      expect(response).to render_template :new
    end
  end

  describe 'GET #edit' do
    it 'assigns requested artist to @artist' do
      artist = create(:artist)
      get :edit, params: { id: artist.id }
      expect(assigns(:artist)).to eq(artist)
    end

    it 'renders #edit template' do
      artist = create(:artist)
      get :edit, params: { id: artist.id }
      expect(response).to render_template :edit
    end
  end

  describe 'POST #create' do
    context 'with valid params' do
      it 'creates a new Artist' do
        expect do
          post :create, params: { artist: attributes_for(:artist) }
        end.to change(Artist, :count).by(1)
      end

      it 'redirects to the @artist' do
        post :create, params: { artist: attributes_for(:artist) }
        expect(response).to redirect_to(Artist.last)
      end
    end

    context 'with invalid params' do
      it 'returns a new template' do
        post :create, params: { artist: attributes_for(:artist, nickname: '') }
        expect(response).to render_template :new
      end
    end

    describe 'PUT #update' do
      context 'valid attributes' do
        it 'updates the requested artist' do
          artist = create(:artist)
          put :update, params: { id: artist.id, artist: attributes_for(:artist, nickname: 'Aaaartist') }
          artist.reload
          expect(assigns(:artist).nickname).to eq('Aaaartist')
        end

        it 'redirects to the artist' do
          artist = create(:artist)
          put :update, params: { id: artist.id, artist: attributes_for(:artist, nickname: 'Aaaartist') }
          expect(response).to redirect_to(artist_path(artist))
        end

        context 'invalid attributes' do
          it 'updates the requested artits' do
            artist = create(:artist)
            put :update, params: { id: artist.id, artist: attributes_for(:artist, nickname: '') }
            expect(response).to render_template :new
          end
        end

        describe 'DELETE #destroy' do
          it 'destroys the requested artist' do
            artist1 = create(:artist)
            artist2 = create(:artist, nickname: 'Jojo')
            artist3 = create(:artist, nickname: 'Boo')
            expect do
              delete :destroy, params: { id: artist2.id }
            end.to change(Artist, :count).by(-1)
          end

          it 'redirects to the artists list' do
            artist1 = create(:artist)
            artist2 = create(:artist, nickname: 'Jojo')
            artist3 = create(:artist, nickname: 'Boo')
            delete :destroy, params: { id: artist1.id }
            expect(response).to redirect_to(artists_path)
          end
        end
      end
    end
  end
end
