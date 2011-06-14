module NavigationHelpers
  module Refinery
    module Routes
      def path_to(page_name)
        case page_name
        when /the list of routes/
          admin_routes_path

         when /the new route form/
          new_admin_route_path
        else
          nil
        end
      end
    end
  end
end
