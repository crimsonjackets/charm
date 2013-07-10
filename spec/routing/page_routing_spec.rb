require 'helper'

describe 'Page routing' do
  routes { Charm::Engine.routes }

  specify { get('/pages').should route_to(controller: 'charm/pages', action: 'index') }

  specify { get('/pages/1').should route_to(controller: 'charm/pages', action: 'show', id: '1') }
  specify { get('/').should route_to(controller: 'charm/pages', action: 'show', path: '') }
  specify { get('/foo/bar').should route_to(controller: 'charm/pages', action: 'show', path: 'foo/bar') }

  specify { get('/pages/new').should route_to(controller: 'charm/pages', action: 'new') }

  specify { post('/pages').should route_to(controller: 'charm/pages', action: 'create') }

  specify { get('/pages/1/edit').should route_to(controller: 'charm/pages', action: 'edit', id: '1') }
  specify { get('/edit').should route_to(controller: 'charm/pages', action: 'edit', path: '') }
  specify { get('/foo/bar/edit').should route_to(controller: 'charm/pages', action: 'edit', path: 'foo/bar') }

  specify { patch('/pages/1').should route_to(controller: 'charm/pages', action: 'update', id: '1') }
  specify { patch('/').should route_to(controller: 'charm/pages', action: 'update', path: '') }
  specify { patch('/foo/bar').should route_to(controller: 'charm/pages', action: 'update', path: 'foo/bar') }

  specify { delete('/pages/1').should route_to(controller: 'charm/pages', action: 'destroy', id: '1') }
  specify { delete('/').should route_to(controller: 'charm/pages', action: 'destroy', path: '') }
  specify { delete('/foo/bar').should route_to(controller: 'charm/pages', action: 'destroy', path: 'foo/bar') }
end
