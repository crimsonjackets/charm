require 'helper'

describe Charm::SessionsController do
  routes { Charm::Engine.routes }

  user = FactoryGirl.create(:user)

  context '#new' do
  end

  context '#create' do
    it 'with valid params' do
      post :create, { email: user.email, password: user.password }
      response.should redirect_to(root_path)
      session[:current_user_id].should == user.id
    end

    it 'with invalid params' do
      post :create, { email: user.email, password: 'wrong_password' }
      response.should render_template(:new)
      session[:current_user_id].should == nil
    end
  end

  context '#destroy' do
    it 'should allow logout to user' do
      session[:current_user_id] = user.id
      delete :destroy
      response.should redirect_to(root_path)
    end

    context 'as guest' do
      specify { expect { delete :destroy }.to raise_error(Charm::Unauthorized) }
    end
  end
end
