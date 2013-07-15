module Charm
  class MetaTag < ActiveRecord::Base
    include HasPath
    include Validators

    serialize :data, Marshal

    validates :data,
      type: { type: Hash }
  end
end
