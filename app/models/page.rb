class Page < ActiveRecord::Base
  include Charm::PathAttribute

  validates :path,
    uniqueness: true

  validates :heading,
    presence: true

  validates :body,
    presence: true
end
