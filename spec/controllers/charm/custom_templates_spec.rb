require 'helper'

describe Charm::PagesController do
  routes { Charm::Engine.routes }

  describe '#show' do
    let(:page) { create :published_page }

    specify do
      get :show, { path: page.path[1..-1] }

      response.should be_successful
      response.should render_template('show')
    end

    specify do
      create :template, path: page.path, file: 'awesome_template'

      get :show, { path: page.path[1..-1] }

      response.should be_successful
      response.should render_template('show/awesome_template')
    end

    specify do
      create :template, path: page.path, file: 'not_existing_template'

      get :show, { path: page.path[1..-1] }

      response.should be_successful
      response.should render_template('show')
    end
  end
end
