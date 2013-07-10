class Page < ActiveRecord::Base
  belongs_to :parent, class_name: :Page, foreign_key: :parent_id
  has_many :children, class_name: :Page, foreign_key: :parent_id

  validates :slug,
    length: { minimum: 0, allow_nil: false, message: "can't be nil" }

  validates :heading,
    presence: true

  validates :body,
    presence: true
end
