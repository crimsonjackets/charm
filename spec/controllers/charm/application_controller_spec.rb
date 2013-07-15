require 'helper'

describe Charm::ApplicationController do
  routes { Charm::Engine.routes }

  describe '#template_file' do
    specify do
      controller.request.stub(:fullpath).and_return('/bar/bazz')

      Charm.config.templates = []
      controller.send(:template_file).should be_nil

      Charm.config.templates = [{ path: '/bar/bazz', file: 'awesome_bar_bazz' }]
      controller.send(:template_file).should == 'awesome_bar_bazz'

      create :template, path: '/foo/bar', file: 'foo_bar'
      controller.send(:template_file).should == 'awesome_bar_bazz'

      create :template, path: '/bar/bazz', file: 'bar_bazz'
      controller.send(:template_file).should == 'bar_bazz'

      controller.request.stub(:fullpath).and_return('/foo/bar')
      controller.send(:template_file).should == 'foo_bar'
    end
  end
end
