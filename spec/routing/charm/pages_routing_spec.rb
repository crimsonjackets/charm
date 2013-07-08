require 'helper'

describe do
  routes { Charm::Engine.routes }

  describe 'GET /pages' do
    it 'routes to pages#index' do
      { get: '/pages' }.should route_to(controller: 'charm/pages', action: 'index')
    end
  end

  describe 'POST /pages' do
    it 'routes to pages#create' do
      { post: '/pages' }.should route_to(controller: 'charm/pages', action: 'create')
    end
  end

  describe 'GET /pages/new' do
    it 'routes to pages#new' do
      { get: '/pages/new' }.should route_to(controller: 'charm/pages', action: 'new')
    end
  end

  describe 'GET /' do
    it 'routes to pages#show' do
      { get: '/' }.should route_to(controller: 'charm/pages', action: 'show', path: '')
    end
  end

  describe 'GET /foo/bar' do
    it 'routes to pages#show' do
      { get: '/foo/bar' }.should route_to(controller: 'charm/pages', action: 'show', path: 'foo/bar')
    end
  end

  describe 'GET /edit' do
    it 'routes to pages#edit' do
      { get: '/edit' }.should route_to(controller: 'charm/pages', action: 'edit', path: '')
    end
  end

  describe 'GET /foo/bar/edit' do
    it 'routes to pages#edit' do
      { get: '/foo/bar/edit' }.should route_to(controller: 'charm/pages', action: 'edit', path: 'foo/bar')
    end
  end

  describe 'PATCH /' do
    it 'routes to pages#update' do
      { patch: '/' }.should route_to(controller: 'charm/pages', action: 'update', path: '')
    end
  end

  describe 'PATCH /foo/bar' do
    it 'routes to pages#update' do
      { patch: '/foo/bar' }.should route_to(controller: 'charm/pages', action: 'update', path: 'foo/bar')
    end
  end

  describe 'DELETE /' do
    it 'routes to pages#destroy' do
      { delete: '/' }.should route_to(controller: 'charm/pages', action: 'destroy', path: '')
    end
  end

  describe 'DELETE /foo/bar' do
    it 'routes to pages#destroy' do
      { delete: '/foo/bar' }.should route_to(controller: 'charm/pages', action: 'destroy', path: 'foo/bar')
    end
  end

  describe 'pages_path' do
    it 'routes to /pages' do
      pages_path.should == '/pages'
    end
  end

  describe 'new_page_path' do
    it 'routes to /pages/new' do
      new_page_path.should == '/pages/new'
    end
  end

  describe 'edit_page_path' do
    context 'when path is blank' do
      it 'routes to /edit' do
        edit_page_path.should == '/edit'
        edit_page_path('').should == '/edit'
      end
    end

    context "when path = 'foo/bar'" do
      it 'routes to /foo/bar/edit' do
        edit_page_path('foo/bar').should == '/foo/bar/edit'
      end
    end
  end

  describe 'page_path' do
    context 'when path is blank' do
      it 'routes to /' do
        page_path.should == '/'
        page_path('').should == '/'
      end
    end

    context "when path = 'foo/bar'" do
      it 'routes to /foo/bar' do
        page_path('foo/bar').should == '/foo/bar'
      end
    end
  end
end
