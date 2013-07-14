class Title < ActiveRecord::Base
  include Charm::HasPath

  validates :path,
    uniqueness: true

  validates :value,
    presence: true
end
