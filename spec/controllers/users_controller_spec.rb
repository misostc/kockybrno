require 'rails_helper'

describe UsersController do
  describe 'GET #index' do
    it 'responds successfully with an HTTP 200 status code' do
      get :index
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it 'renders the index template' do
      get :index
      expect(response).to render_template('index')
    end

    it 'loads all of the users into @users' do
      user1, user2 = FactoryGirl.create(:user), FactoryGirl.create(:user)
      get :index
      expect(assigns(:users)).to match([user1, user2].sort_by(&:nice_name))
    end
  end
end
