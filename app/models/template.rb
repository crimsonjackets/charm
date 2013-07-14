class Template < ActiveRecord::Base
  include Charm::HasPath

  validates :method,
    presence: true

  validates :method,
    inclusion: { in: %w[get post patch delete] },
    unless: -> { method.blank? }

  validates :path,
    uniqueness: { scope: [:method, :format] }
end
