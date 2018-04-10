module NavigationHelpers

    def path_to(page_name)
        case page_name

        when /the login page/
            # '/login'
            'auth/login'

        when /my dashboard/
            'dashboards/dashboard_1'

        when /the Apply Permit page/
            'apply/apply'

        when /the list of pending permits/
            'apply/pending'

        when /the list of approved permits/
            'apply/approved'
        
        when /the list of rejected permits/
            'apply/rejected'

        when /calendar/
            'calendar/calendar'

        when /Forgot password/
            'auth/forgot_password'

        when /as/
            'as'

        else
            raise "Can't find mapping"
        end
    end

    def buttons(button)
        case button

        when /'Login'/
            click_button("Login")
        
        when /'Apply Permit'/
            click_button("Apply Permit")

        when /'Pending Permits'/
            click_button("Pending Permits")
        
        when /'Approved Permits'/
            click_button("Approved Permits")

        when /'Rejected Permits'/
            click_button("Rejected Permits")

        when /'See Calendar'/
            click_button("See Calendar")

        when /'Forgot Password?'/
            click_button("Forgot Password?")

        else
            raise "Can't find button"
        
        end
    end
end

World(NavigationHelpers)