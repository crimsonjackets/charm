require 'helper'

describe Charm::PagesController do
  routes { Charm::Engine.routes }

  describe '#index' do
  end

  describe '#show' do
    context 'when not signed in' do
      before { controller.send :current_user=, nil }

      context do
        let(:page) { create :published_page }

        specify { expect(get :show, { id: page.id }).to be_success }
        specify { expect(get :show, { path: page.path[1..-1] }).to be_success }
      end

      [:not_yet_published_page, :not_published_page].each do |factory_name|
        context do
          let(:page) { create factory_name }

          specify { expect { get :show, { id: page.id } }.to raise_error(ActiveRecord::RecordNotFound) }
          specify { expect { get :show, { path: page.path[1..-1] } }.to raise_error(ActiveRecord::RecordNotFound) }
        end
      end
    end

    context 'when signed in as admin' do
      before { controller.send :current_user=, create(:admin) }

      [:published_page, :not_yet_published_page, :not_published_page].each do |factory_name|
        context do
          let(:page) { create factory_name }

          specify { expect(get :show, { id: page.id }).to be_success }
          specify { expect(get :show, { path: page.path[1..-1] }).to be_success }
        end
      end
    end
  end

  describe '#new' do
    context 'when signed in as guest or user' do
      [nil, FactoryGirl.create(:user)].each do |user|
        before { controller.send :current_user=, user }

        specify { expect { get :new }.to raise_error(Charm::Forbidden) }
      end
    end

    context 'when signed in as admin' do
      before { controller.send :current_user=, create(:admin) }

      specify { expect { get :new }.not_to raise_error }
    end
  end

  describe '#edit' do
    let(:page) { create :page }

    context 'when signed in as guest or user' do
      [nil, FactoryGirl.create(:user)].each do |user|
        before { controller.send :current_user=, user }

        specify { expect { get :edit, { id: page.id } }.to raise_error(Charm::Forbidden) }
      end
    end

    context 'when signed in as admin' do
      before { controller.send :current_user=, create(:admin) }

      specify { expect { get :edit, { id: page.id } }.not_to raise_error }
    end
  end

  describe '#create' do
    let(:page) { attributes_for(:page) }

    context 'when signed in as admin' do
      context 'when params valid' do
        before { controller.send :current_user=, create(:admin) }

        specify { expect { post :create, { page: page } }.to change(Page, :count).by(1) }
      end

      context 'when params invalid' do
        [
          { path: nil },
          { path: '$' },
          { body: nil },
          { heading: nil}
        ].each do |param|
          context do
            before { controller.send :current_user=, create(:admin) }

            specify { expect { post :create, { page: page.merge(param) } }.not_to change(Page, :count).by(1) }
          end
        end

        context 'test uniqueness' do
          before { controller.send :current_user=, create(:admin) }
          path = FactoryGirl.create(:page).path

          specify { expect { post :create, { page: page.merge(path: path) } }.not_to change(Page, :count).by(1) }
        end
      end
    end

    context 'when signed in as user or guest' do
      [nil, FactoryGirl.create(:user)].each do |user|
        before { controller.send :current_user=, user }

        specify { expect { post :create, { page: page } }.to raise_error(Charm::Forbidden) }
      end
    end
  end

  # describe '#update' do
  # end
  #
  # describe '#destroy' do
  #   it 'should destroy if admin' do
  #     id = FactoryGirl.create(:page).id
  #     lambda { delete :destroy, { id: id }, valid_session }.should change(Page, :count).by(-1)
  #   end
  #
  #   it 'should restrict if not admin' do
  #     id = FactoryGirl.create(:page).id
  #     lambda { delete :destroy, { id: id }, nil }.should raise_error(Charm::Unauthorized)
  #   end
  # end
end
