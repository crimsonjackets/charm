require 'helper'

describe Charm::TitlesController do
  routes { Charm::Engine.routes }

  it_behaves_like Charm::Scaffold, :title, only: [:create, :update, :destroy]
end
