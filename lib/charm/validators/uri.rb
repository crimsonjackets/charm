require 'uri'

module Charm
  module Validators
    module URI
      class PathValidator < ActiveModel::EachValidator
        def validate_each(record, attribute, value)
          record.errors.add(attribute, options[:message]) unless value =~ ::URI::DEFAULT_PARSER.regexp[:ABS_PATH]
        end
      end
    end
  end
end
