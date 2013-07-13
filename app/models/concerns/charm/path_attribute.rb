module Charm
  module PathAttribute
    extend ActiveSupport::Concern

    included do
      include Validators::URI

      validates :path,
        presence: true

      validates :path,
        path: true,
        unless: -> { path.blank? }
    end
  end
end
