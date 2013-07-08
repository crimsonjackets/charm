module Charm
  module Routing
    module LocaleConstraint
      def self.matches? request
        [nil, 'ru', 'en'].include? request.path_parameters[:locale]
      end
    end
  end
end
