module Charm
  module Routing
    module Constraints
      module Locale
        def self.matches? request
          [nil, 'ru', 'en'].include? request.path_parameters[:locale]
        end
      end
    end
  end
end
