require 'helper'

describe Charm::Page do
  subject { create :page }

  it_behaves_like Charm::HasPath
  it { should validate_uniqueness_of(:path) }

  %w[/session/new /pages /pages/new /pages/1 /pages/1/edit].each do |wrong_path|
    it { should_not allow_value(wrong_path).for(:path) }
  end

  it { should validate_presence_of(:heading) }
  it { should validate_presence_of(:body) }
end
