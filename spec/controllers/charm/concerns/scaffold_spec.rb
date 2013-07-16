require 'helper'

shared_examples_for Charm::Scaffold do |model_name, options|
  actions = {
    index: 'get :index',
    show:  "get :show, id: #{model_name}.id",
    new:  'get :new',
    edit: "get :edit, id: #{model_name}.id",
    create: "post :create, #{model_name}: #{model_name}_params",
    update: "put :update, { id: #{model_name}.id, #{model_name}: #{model_name}_params }",
    destroy: "delete :destroy, id: #{model_name}.id"
  }

  if options.try(:[], :only).present?
    actions.slice!(*options[:only])
  elsif options.try(:[], :except).present?
    actions.except!(*options[:except])
  end

  let(model_name) { create model_name }
  let("#{model_name}_params") { attributes_for model_name }

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

  describe '#create' do
    context 'creating a record' do
      specify do
        controller.send :current_user=, create(:admin)
        expect { instance_eval(actions[:create]) }.to change(instance_eval("Charm::#{model_name.to_s.camelize}"), :count).by(1)
      end
    end
  end if actions.has_key?(:create)

  describe '#destroy' do
    context 'destroying a record' do
      specify do
        controller.send :current_user=, create(:admin)
        page_id = instance_eval(model_name.to_s).id
        expect { delete :destroy, { id: page_id } }.to change(instance_eval("Charm::#{model_name.to_s.camelize}"), :count).by(-1)
      end
    end
  end if actions.has_key?(:destroy)
end
