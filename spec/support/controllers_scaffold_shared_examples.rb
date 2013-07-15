require 'helper'

shared_examples_for 'Charm::Scaffold' do
  describe '#new' do
    context 'when not signed in' do
      specify do
        expect { get :new }.to raise_error(Charm::Unauthorized)
      end
    end

    context 'when signed in as user' do
      specify do
        controller.send :current_user=, create(:user)
        expect { get :new }.to raise_error(Charm::Forbidden)
      end
    end

    context 'when signed in as admin' do
      specify do
        controller.send :current_user=, create(:admin)
        expect { get :new }.not_to raise_error
      end
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

  describe '#destroy' do
    id = FactoryGirl.create(:page).id

    context 'when signed in as admin' do
      before { controller.send :current_user=, create(:admin) }

      id = FactoryGirl.create(:page).id

      specify { expect { delete :destroy, { id: id } }.to change(Page, :count).by(-1) }
    end

    context 'when signed in as guest or user' do
      [nil, FactoryGirl.create(:page)].each do |user|
        context do
          before { controller.send :current_user=, user }

          specify { expect { delete :destroy, { id: id } }.to raise_error(Charm::Unauthorized) }
        end
      end
    end
  end
end
