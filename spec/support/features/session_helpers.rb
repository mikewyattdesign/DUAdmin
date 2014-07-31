module Features
    # Helpers for handling the session
    module SessionHelpers
        def basic_auth
            page.driver.browser.basic_authorize 'group360', 'z2#j$n4d#AXEFWWS9c4x'
        end
    end
end
