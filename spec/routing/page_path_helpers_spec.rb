describe 'Page path helpers' do
  routes { Charm::Engine.routes }

  describe 'pages_path' do
    specify { pages_path.should == '/pages' }
  end

  describe 'page_path' do
    specify { page_path.should == '/' }
    specify { page_path('').should == '/' }
    specify { page_path('foo/bar').should == '/foo/bar' }
  end

  describe 'new_page_path' do
    specify { new_page_path.should == '/pages/new' }
  end

  describe 'edit_page_path' do
    specify { edit_page_path.should == '/edit' }
    specify { edit_page_path('').should == '/edit' }
    specify { edit_page_path('foo/bar').should == '/foo/bar/edit' }
  end
end
