require 'helper'

shared_examples_for Charm::Scaffold do |options|
  actions = {
    index: 'get :index',
    show:  'get :show, id: page.id',
    new:  'get :new',
    edit: 'get :edit, id: page.id',
    create: 'post :create, page: page_params',
    update: 'put :update, { id: page.id, page: page_params }',
    destroy: 'delete :destroy, id: page.id'
  }

  if options.try(:[], :only).present?
    actions.slice!(*options[:only])
  elsif options.try(:[], :except).present?
    actions.except!(*options[:except])
  end

  let(:page) { create :page }
  let(:page_params) { attributes_for :page }

  actions.each_pair do |name, action|
    describe "##{name}" do
      context 'when signed in as admin' do
        specify do
          controller.send :current_user=, create(:admin)
          expect { instance_eval(action) }.not_to raise_error
        end
      end

      context 'when signed in as user' do
        specify do
          controller.send :current_user=, create(:user)
          expect { instance_eval(action) }.to raise_error(Charm::Forbidden)
        end
      end

      context 'when signed_in_as_guest' do
        specify do
          expect { instance_eval(action) }.to raise_error(Charm::Unauthorized)
        end
      end
    end
  end
end
