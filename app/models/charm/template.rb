module Charm
  class Template < ActiveRecord::Base
    include HasPath

    validates :path,
      uniqueness: true
  end
end
