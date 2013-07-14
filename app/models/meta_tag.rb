class MetaTag < ActiveRecord::Base
  include Charm::HasPath
  include Charm::Validators

  serialize :data, Marshal

  validates :data,
    type: { type: Hash }
end
