require 'rails_helper'

describe TomcatsController do
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

    it 'contains confirmed tomcat in @tomcats' do
      tomcat = FactoryGirl.create(:tomcat, confirmed: true)
      get :index
      expect(assigns(:tomcats)).to include(tomcat)
    end

    it 'does not contain unconfirmed tomcat in @tomcats' do
      tomcat = FactoryGirl.create(:tomcat, confirmed: false)
      get :index
      expect(assigns(:tomcats)).not_to include(tomcat)
    end

    it 'contains users tomcat in @user_tomcats' do
      user = FactoryGirl.create(:user)
      tomcat = FactoryGirl.create(:tomcat, user: user)
      user2 = FactoryGirl.create(:user)
      tomcat2 = FactoryGirl.create(:tomcat, user: user2)
      sign_in user
      get :index
      expect(assigns(:user_tomcats)).to include(tomcat)
      expect(assigns(:user_tomcats)).not_to include(tomcat2)
    end
  end

  describe 'GET #new' do
    context 'with user signed in' do
      before(:each) do
        sign_in FactoryGirl.create(:user)
      end

      it 'responds successfully with an HTTP 200 status code' do
        get :new
        expect(response).to be_success
        expect(response).to have_http_status(200)
      end

      it 'renders the new template' do
        get :new
        expect(response).to render_template('new')
      end
    end

    context 'without user signed in' do
      it 'redirects to sign in' do
        get :new
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end

  describe 'POST #create' do
    context 'with user signed in' do
      before(:each) do
        sign_in FactoryGirl.create(:user)
      end

      it 'succeedes with valid attributes' do
        expect { post :create, tomcat: FactoryGirl.attributes_for(:tomcat) }.to change(Tomcat, :count).by(+1)
        expect(response).to redirect_to(tomcats_path)
      end

      it 'renders new with invalid attributes' do
        post :create, tomcat: FactoryGirl.attributes_for(:tomcat, description: nil)
        expect(response).to render_template('new')
      end
    end

    context 'without user signed in' do
      it 'redirects to sign in' do
        post :create, tomcat: FactoryGirl.attributes_for(:tomcat)
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end

  describe 'DELETE #destroy' do
    context 'with user signed in' do
      before(:each) do
        @user = FactoryGirl.create(:user)
        sign_in @user
      end

      it 'deletes users tomcat' do
        tomcat = FactoryGirl.create(:tomcat, user: @user)
        expect { delete :destroy, id: tomcat.id }.to change(Tomcat, :count).by(-1)
        expect(response).to redirect_to(tomcats_path)
      end

      it "doesn't delete other users tomcat" do
        tomcat = FactoryGirl.create(:tomcat)
        expect { delete :destroy, id: tomcat.id }.not_to change(Tomcat, :count)
        expect(response).to redirect_to(tomcats_path)
      end

      it 'raises RecordNotFound when id not valid' do
        expect { delete :destroy, id: 40 }.to raise_error ActiveRecord::RecordNotFound
      end
    end

    context 'without user signed in' do
      it 'redirects to sign in' do
        delete :destroy, id: FactoryGirl.create(:tomcat).id
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end
end
