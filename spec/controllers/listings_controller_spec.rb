require 'rails_helper'

RSpec.describe ListingsController, type: :controller do

  let(:valid_attributes) {
    { name: 'listing', price: 1.0, description: 'description of listing' }
  }

  let(:invalid_attributes) {
    { name: '', price: '', description: ''}
  }

  let(:valid_session) { {} }

  describe "GET #index" do
    it "assigns all listings as @listings" do
      listing = Listing.create! valid_attributes
      get :index, params: {}, session: valid_session
      expect(assigns(:listings)).to eq([listing])
    end
  end

  describe "GET #show" do
    it "assigns the requested listing as @listing" do
      listing = Listing.create! valid_attributes
      get :show, params: {id: listing.to_param}, session: valid_session
      expect(assigns(:listing)).to eq(listing)
    end
  end

  describe "GET #new" do
    it "assigns a new listing as @listing" do
      get :new, params: {}, session: valid_session
      expect(assigns(:listing)).to be_a_new(Listing)
    end
  end

  describe "GET #edit" do
    it "assigns the requested listing as @listing" do
      listing = Listing.create! valid_attributes
      get :edit, params: {id: listing.to_param}, session: valid_session
      expect(assigns(:listing)).to eq(listing)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Listing" do
        expect {
          post :create, params: {listing: valid_attributes}, session: valid_session
        }.to change(Listing, :count).by(1)
      end

      it "assigns a newly created listing as @listing" do
        post :create, params: {listing: valid_attributes}, session: valid_session
        expect(assigns(:listing)).to be_a(Listing)
        expect(assigns(:listing)).to be_persisted
      end

      it "redirects to the created listing" do
        post :create, params: {listing: valid_attributes}, session: valid_session
        expect(response).to redirect_to(Listing.last)
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved listing as @listing" do
        post :create, params: {listing: invalid_attributes}, session: valid_session
        expect(assigns(:listing)).to be_a_new(Listing)
      end

      it "re-renders the 'new' template" do
        post :create, params: {listing: invalid_attributes}, session: valid_session
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        { name: "listing2", price: 2.0, description: "new description of listing" }
      }

      it "updates the requested listing" do
        listing = Listing.create! valid_attributes
        put :update, params: {id: listing.to_param, listing: new_attributes}, session: valid_session
        listing.reload
        # skip("Add assertions for updated state")
        assert_equal "listing2", listing.name
        assert_equal 2.0, listing.price
        assert_equal "new description of listing", listing.description
      end

      it "assigns the requested listing as @listing" do
        listing = Listing.create! valid_attributes
        put :update, params: {id: listing.to_param, listing: valid_attributes}, session: valid_session
        expect(assigns(:listing)).to eq(listing)
      end

      it "redirects to the listing" do
        listing = Listing.create! valid_attributes
        put :update, params: {id: listing.to_param, listing: valid_attributes}, session: valid_session
        expect(response).to redirect_to(listing)
      end
    end

    context "with invalid params" do
      it "assigns the listing as @listing" do
        listing = Listing.create! valid_attributes
        put :update, params: {id: listing.to_param, listing: invalid_attributes}, session: valid_session
        expect(assigns(:listing)).to eq(listing)
      end

      it "re-renders the 'edit' template" do
        listing = Listing.create! valid_attributes
        put :update, params: {id: listing.to_param, listing: invalid_attributes}, session: valid_session
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested listing" do
      listing = Listing.create! valid_attributes
      expect {
        delete :destroy, params: {id: listing.to_param}, session: valid_session
      }.to change(Listing, :count).by(-1)
    end

    it "redirects to the listings list" do
      listing = Listing.create! valid_attributes
      delete :destroy, params: {id: listing.to_param}, session: valid_session
      expect(response).to redirect_to(listings_url)
    end
  end

end
