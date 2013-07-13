class MetaTag < ActiveRecord::Base
  include Charm::Validators
  include Charm::PathAttribute

  serialize :data, Marshal

  validates :data,
    type: { type: Hash }
end
