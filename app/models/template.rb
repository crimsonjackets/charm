class Template < ActiveRecord::Base
  include Charm::HasPath

  validates :path,
    uniqueness: true
end
