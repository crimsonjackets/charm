class Page < ActiveRecord::Base
  class PagePathValidator < ActiveModel::EachValidator
    def validate_each record, attribute, value
    end
  end

  include Charm::HasPath

  validates :path,
    page_path: true,
    uniqueness: true

  validates :heading,
    presence: true

  validates :body,
    presence: true
end
