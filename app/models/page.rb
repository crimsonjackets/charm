class Page < ActiveRecord::Base
  validates :slug,
    length: { minimum: 0, allow_nil: false, message: "can't be nil" }

  validates :heading,
    presence: true

  validates :body,
    presence: true
end
