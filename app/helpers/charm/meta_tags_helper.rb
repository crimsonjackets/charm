module Charm
  module MetaTagsHelper
    def render_title
      title = Title.find_by_path(request.fullpath)

      value = if title
        title.value.html_safe
      elsif content_for? :title
        content_for :title
      elsif content_for? :heading
        strip_tags content_for(:heading)
      end

      content_tag(:title, value) if value
    end

    def render_meta_tags
      MetaTag.where(path: request.fullpath).map { |meta_tag| tag :meta, meta_tag.data }.join.html_safe
    end
  end
end
