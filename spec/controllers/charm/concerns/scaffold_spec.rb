require 'helper'

shared_examples_for Charm::Scaffold do
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
end
