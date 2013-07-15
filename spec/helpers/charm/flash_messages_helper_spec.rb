require 'helper'

describe Charm::FlashMessagesHelper do
  let(:type) { 'alert' }
  let(:message) { 'message' }
  let(:closer) { true }
  let(:flash_message) { {type: type, message: message} }

  describe '#render_flash_message' do
    specify do
      helper.render_flash_message('alert', message).should have_selector('div.charm-flash-alert')
      helper.render_flash_message('success', message).should have_selector('div.charm-flash-success')
      helper.render_flash_message('alert', message).should have_selector('div[data-type="alert"]')
      helper.render_flash_message('success', message).should have_selector('div[data-type="success"]')

      helper.render_flash_message(type, 'foo').should have_selector('div', text: 'foo')
      helper.render_flash_message(type, 'bar').should have_selector('div', text: 'bar')

      helper.render_flash_message(type, message, true).should have_selector('div[data-closer="true"]')
      helper.render_flash_message(type, message, false).should have_selector('div[data-closer="false"]')

      helper.render_flash_message(type, message, closer, 5000).should have_selector('div[data-hide="5000"]')
      helper.render_flash_message(type, message, closer, 10000).should have_selector('div[data-hide="10000"]')
    end
  end

  describe '#render_flash_messages' do
    specify do
      helper.stub(:flash).and_return([])
      helper.render_flash_messages.should be_blank

      helper.stub(:flash).and_return(Array.new(1, flash_message))
      helper.render_flash_messages.should have_selector('div', count: 1)

      helper.stub(:flash).and_return(Array.new(2, flash_message))
      helper.render_flash_messages.should have_selector('div', count: 2)

      helper.stub(:flash).and_return(Array.new(3, flash_message))
      helper.render_flash_messages.should have_selector('div', count: 3)
    end
  end
end
