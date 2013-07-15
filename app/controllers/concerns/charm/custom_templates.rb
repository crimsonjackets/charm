module Charm
  module CustomTemplates
    extend ActiveSupport::Concern
  protected
    def render *args
      options = _normalize_render *args

      if request.get?
        options[:template] = "#{options[:template]}/#{template_file}"
      end

      super options
    rescue ActionView::MissingTemplate
      super
    end

    def template_file
      template = Template.find_by_path(request.fullpath).try(:file)
      template ||= Charm.config.templates.find { |template| template[:path] == request.fullpath }.try(:[], :file)
    end
  end
end
