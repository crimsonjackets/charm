require 'helper'

describe Charm::PagesController do
  routes { Charm::Engine.routes }

  it_behaves_like 'Charm::Scaffold'

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

  describe '#create' do
    let(:page) { attributes_for(:page) }

    context 'when signed in as admin' do
      context 'when params valid' do
        before { controller.send :current_user=, create(:admin) }

        specify { expect { post :create, { page: page } }.to change(Charm::Page, :count).by(1) }
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

            specify { expect { post :create, { page: page.merge(param) } }.not_to change(Charm::Page, :count).by(1) }
          end
        end

        context 'test uniqueness' do
          before { controller.send :current_user=, create(:admin) }
          path = FactoryGirl.create(:page).path

          specify { expect { post :create, { page: page.merge(path: path) } }.not_to change(Charm::Page, :count).by(1) }
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

  describe '#update' do
    let(:page) { attributes_for(:page) }

    context 'when signed in as admin' do
      context 'when params valid' do
        before { controller.send :current_user=, create(:admin) }

        id = FactoryGirl.create(:page).id

        specify { expect { put :update, { id: id, page: page } }.to change{Charm::Page.find(id).as_json} }
      end

      context 'when params invalid' do
        id = FactoryGirl.create(:page).id

        [
          { path: nil },
          { path: '$' },
          { body: nil },
          { heading: nil}
        ].each do |param|
          context do
            before { controller.send :current_user=, create(:admin) }

            specify { expect { put :update, { id: id, page: page.merge(param) } }.not_to change{Charm::Page.find(id).as_json} }
          end
        end

        context 'test uniqueness' do
          before { controller.send :current_user=, create(:admin) }

          path = FactoryGirl.create(:page).path

          specify { expect { put :update, { id: id, page: page.merge(path: path) } }.not_to change{Charm::Page.find(id).as_json} }
        end
      end
    end

    context 'when signed in as user or guest' do
      [nil, FactoryGirl.create(:user)].each do |user|
        before { controller.send :current_user=, user }

        id = FactoryGirl.create(:page).id

        specify { expect { put :create, { id: id, page: page } }.to raise_error(Charm::Forbidden) }
      end
    end
  end
end
