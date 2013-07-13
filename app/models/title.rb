class Title < ActiveRecord::Base
  include Charm::PathAttribute

  validates :path,
    uniqueness: true

  validates :value,
    presence: true
end
