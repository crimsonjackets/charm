module Charm
  module FlashMessagesHelper
    def render_flash_message type, message, closer = true, hide = nil
      content_tag :div, message, class: "charm-flash charm-flash-#{type}", data: { type: type, closer: closer, hide: hide }
    end

    def render_flash_messages
      flash.map { |type, message| flash_message(type, message) }.join.html_safe
    end
  end
end
