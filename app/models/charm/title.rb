module Charm
  class Title < ActiveRecord::Base
    include HasPath

    validates :path,
      uniqueness: true

    validates :value,
      presence: true
  end
end
