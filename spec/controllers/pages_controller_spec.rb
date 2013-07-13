require 'helper'

describe Charm::PagesController do
  routes { Charm::Engine.routes }

  before(:each) do
    FactoryGirl.create(:admin)
    FactoryGirl.create(:user)
  end

  def valid_params
    {
      path: FactoryGirl.attributes_for(:page)[:path],
      heading: FactoryGirl.attributes_for(:page)[:heading],
      body: FactoryGirl.attributes_for(:page)[:body],
      published: true
    }
  end

  def valid_session
    { current_user_id: Admin.all.sample.id }
  end

  describe 'index' do
  end

  describe 'show' do
    describe 'published page' do
      let(:page) { FactoryGirl.create(:page, published_at: 2.years.from_now) }

      it 'should show published page by id' do
        get :show, { id: page.id }
        response.should be_success
      end

      it 'should show published page by path' do
        get :show, { path: page.path.gsub('/', '') }
        response.should be_success
      end
    end

    describe 'unpublished page' do
      it 'should not show unpublished page' do

      end
    end
  end

  describe 'new' do
  end

  describe 'edit' do
  end

  describe 'create' do
    describe 'valid' do
      it 'should require admin' do
        lambda { post :create, { page: valid_params }, valid_session }.should_not raise_error
      end

      it 'should be created' do
        lambda { post :create, { page: valid_params }, valid_session }.should change(Page, :count).by(1)
      end
    end

    describe 'invalid' do
      it 'should require admin' do
        lambda { post :create, { page: valid_params }, { current_user_id: User.pluck(:id).sample } }.should raise_error(Charm::Forbidden)
        lambda { post :create, { page: valid_params } }.should raise_error(Charm::Forbidden)
      end

      describe 'it should require valid options' do
        it 'should require path' do
          post :create, { page: valid_params.merge(path: nil) }, valid_session
        end

        it 'should require heading' do
          post :create, { page: valid_params.merge(heading: nil) }, valid_session
        end

        it 'should require body' do
          post :create, { page: valid_params.merge(body: nil) }, valid_session
        end

        it 'should require uniqueness of path' do
          path = FactoryGirl.create(:page).path
          post :create, { page: valid_params.merge(path: path) }, valid_session
        end

        it 'should require valid path' do
          post :create, { page: valid_params.merge(path: '$') }, valid_session
        end

        after(:each) do
          response.should render_template(:new)
        end
      end
    end
  end

  describe 'update' do
  end

  describe 'destroy' do
    it 'should destroy if admin' do
      id = FactoryGirl.create(:page).id
      lambda { delete :destroy, { id: id }, valid_session }.should change(Page, :count).by(-1)
    end

    it 'should restrict if not admin' do
      id = FactoryGirl.create(:page).id
      lambda { delete :destroy, { id: id }, nil }.should raise_error(Charm::Unauthorized)
    end
  end
end
