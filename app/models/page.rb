class Page < ActiveRecord::Base
  include Charm::HasPath

  validates :path,
    uniqueness: true

  validate :ensure_path_is_not_reserved

  validates :heading,
    presence: true

  validates :body,
    presence: true
private
  def ensure_path_is_not_reserved
    action = Charm::Engine.routes.recognize_path path
    errors.add :path unless action == { controller: 'charm/pages', action: 'show', path: path.try(:[], 1..-1).to_s }
  end
end
