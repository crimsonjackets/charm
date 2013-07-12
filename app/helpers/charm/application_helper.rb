module Charm
  module ApplicationHelper
    def render_flash_message type, message, closer = true, hide = nil
      content_tag :div, message, class: "charm-flash charm-flash-#{type}", data: { type: type, closer: closer, hide: hide }
    end

    def render_flash_messages
      flash.map { |type, message| render_flash_message(type, message) }.join.html_safe
    end

    def errors_for record, options = {}
      if options.key?(:only) && options.key?(:except)
        raise ArgumentError, 'Either :only or :except must be supplied (but not both)'
      end

      messages = []

      record.errors.each do |key, value|
        next if options.key?(:only) && ![*options[:only]].include?(key)
        next if options.key?(:except) && [*options[:except]].include?(key)

        if !options.key?(:full) || options[:full]
          messages << record.errors.full_message(key, value)
        else
          messages << value
        end
      end

      messages
    end

    def render_errors errors
      content_tag :ul, class: 'charm-form-errors' do
        errors.map { |error| content_tag :li, error }.join.html_safe
      end if errors.any?
    end
  end
end
