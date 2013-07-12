module Charm
  module UrlHelpers
    def self.included base
      base.alias_method_chain :define_url_helper, :charm
    end

    def define_url_helper_with_charm route, name, options
      if [:page_path, :page_url, :edit_page_path, :edit_page_url].include? name
        helper = ActionDispatch::Routing::RouteSet::NamedRouteCollection::UrlHelper.create route, options.dup

        @module.remove_possible_method name
        @module.module_eval do
          define_method name do |*args|
            path = args.shift

            if path.kind_of? Page
              path = path.path
            elsif (Integer(path) > 0 rescue nil)
              path = Page.where(id: path).first.try :path
            end

            args.unshift path.to_s.sub(/\A\/+/, '')

            helper.call self, args
          end
        end

        helpers << name
      else
        define_url_helper_without_charm route, name, options
      end
    end
  end
end
