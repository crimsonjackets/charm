module Charm
  module Validators
    class TypeValidator < ActiveModel::EachValidator
      def validate_each(record, attribute, value)
        record.errors.add(attribute, options[:message]) unless value.is_a?(options[:type])
      end
    end
  end
end
