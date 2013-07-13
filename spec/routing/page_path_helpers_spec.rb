describe 'Page path helpers' do
  routes { Charm::Engine.routes }

  describe 'pages_path' do
    specify { pages_path.should == '/pages' }
  end

  describe 'page_path' do
    specify { page_path.should == '/' }
    specify { page_path('').should == '/' }
    specify { page_path('/').should == '/' }
    specify { page_path('foo/bar').should == '/foo/bar' }
    specify { page_path('/foo/bar').should == '/foo/bar' }
  end

  describe 'new_page_path' do
    specify { new_page_path.should == '/pages/new' }
  end

  describe 'edit_page_path' do
    specify { edit_page_path.should == '/edit' }
    specify { edit_page_path('').should == '/edit' }
    specify { edit_page_path('/').should == '/edit' }
    specify { edit_page_path('foo/bar').should == '/foo/bar/edit' }
    specify { edit_page_path('/foo/bar').should == '/foo/bar/edit' }
  end

  context do
    let(:foo_page) { create :page, path: '/foo' }
    let(:foo_bar_page) { create(:page, path: '/foo/bar') }

    describe 'page_path' do
      specify { page_path(foo_page).should == '/foo' }
      specify { page_path(foo_page.id).should == '/foo' }
      specify { page_path(foo_page.id.to_s).should == '/foo' }
      specify { page_path(foo_bar_page).should == '/foo/bar' }
      specify { page_path(foo_bar_page.id).should == '/foo/bar' }
      specify { page_path(foo_bar_page.id.to_s).should == '/foo/bar' }
    end

    describe 'edit_page_path' do
      specify { edit_page_path(foo_page).should == '/foo/edit' }
      specify { edit_page_path(foo_page.id).should == '/foo/edit' }
      specify { edit_page_path(foo_page.id.to_s).should == '/foo/edit' }
      specify { edit_page_path(foo_bar_page).should == '/foo/bar/edit' }
      specify { edit_page_path(foo_bar_page.id).should == '/foo/bar/edit' }
      specify { edit_page_path(foo_bar_page.id.to_s).should == '/foo/bar/edit' }
    end
  end
end
