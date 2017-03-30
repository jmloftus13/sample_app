require 'rails_helper'

RSpec.describe ProductsController, type: :controller do

  describe "GET #index" do
      before do
        @product = FactoryGirl.create(:product)
        @product2 = FactoryGirl.create(:product)
      end

      it "all products are shown" do
        get :index

        expect(response).to have_http_status(200)
        expect(assigns(:products)).to eq Product.all

      end

      it 'renders the :index view' do
        get :index
        expect(response).to render_template :index
      end



  end

  describe "GET #show" do

    before do
      @product = FactoryGirl.create(:product)
    end

      it "Correct Product is shown" do
        get :show, params:{id: @product.id}

        expect(response).to have_http_status(200)
        expect(assigns(:product)).to eq @product

      end

    it 'renders the #show view' do
      get :show, params:{id: @product.id}
      expect(response).to render_template :show
    end

  end

  describe "POST #new" do

    before do
      @product = FactoryGirl.create(:product)
    end

    it "creates a new Product" do
      post :new
      expect(assigns(:product)).to be_a_new(Product)
    end

  end

  describe "DELETE #destroy" do
    before do
      @product = FactoryGirl.create(:product)
      @product2 = FactoryGirl.create(:product)
    end

    it "deletes a product" do
      # delete :destroy, params:{id: @product.id}

      # expect{@product.destroy}.to change(Product, :count).by(1)
      expect{delete :destroy, params:{id: @product.id}}.to change(Product, :count).by(-1)

    end

  end

end