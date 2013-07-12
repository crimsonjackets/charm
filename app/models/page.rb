class Page < ActiveRecord::Base
  include Charm::Validators::URI

  validates :path,
    presence: true

  validates :path,
    uniqueness: true,
    path: true,
    unless: -> { path.blank? }

  validates :heading,
    presence: true

  validates :body,
    presence: true
end
