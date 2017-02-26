require 'rails_helper'

#use the exact same name of the controller class that is used in app/controllers/static_pages_controller.rb
describe StaticPagesController, :type => :controller do

  #calling the context 'get index' becasue we make an http GET request of the index action.
  context 'GET #index' do
    before do
      get :index
    end

    #tests if page loads successfully & http status is 200
    it 'responds successfully with an HTTP 200 status code' do
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    #tests to see f teh correct template is loaded
    it 'renders the index template' do
      expect(response).to render_template('index')
    end
  end

end