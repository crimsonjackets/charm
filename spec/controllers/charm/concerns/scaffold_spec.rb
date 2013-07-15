require 'helper'

shared_examples_for Charm::Scaffold do
  let(:page) { create :page }

  describe '#new' do
    context 'when signed in as admin' do
      specify do
        controller.send :current_user=, create(:admin)
        expect { get :new }.not_to raise_error
      end
    end

    context 'when signed in as user' do
      specify do
        controller.send :current_user=, create(:user)
        expect { get :new }.to raise_error(Charm::Forbidden)
      end
    end

    context 'when not signed in' do
      specify do
        expect { get :new }.to raise_error(Charm::Unauthorized)
      end
    end
  end

  describe '#edit' do
    context 'when signed in as admin' do
      specify do
        controller.send :current_user=, create(:admin)
        expect { get :edit, { id: page.id } }.not_to raise_error
      end
    end

    context 'when signed in as user' do
      specify do
        controller.send :current_user=, create(:user)
        expect { get :edit, { id: page.id } }.to raise_error(Charm::Forbidden)
      end
    end

    context 'when signed in as guest' do
      specify do
        expect { get :edit, { id: page.id } }.to raise_error(Charm::Unauthorized)
      end
    end
  end

  describe '#destroy' do
    context 'when signed in as admin' do
      specify do
        controller.send :current_user=, create(:admin)
        expect { delete :destroy, { id: page.id } }.not_to raise_error
      end
    end

    context 'when signed in as user' do
      specify do
        controller.send :current_user=, create(:user)
        expect { delete :destroy, { id: page.id } }.to raise_error(Charm::Forbidden)
      end
    end

    context 'when signed in as guest or user' do
      specify { expect { delete :destroy, { id: page.id } }.to raise_error(Charm::Unauthorized) }
    end
  end
end
