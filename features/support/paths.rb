module NavigationHelpers

    def path_to(page_name)
        case page_name

        when /the login page/
            # '/login'
            'auth/login'

        when /my dashboard/
            'dashboards/dashboard_1'
        else
            raise "Can't find mapping"
        end
    end
end

World(NavigationHelpers)