module Api
    class ApiController < ApplicationController
        # Protect from forgery with null_session for API
        protect_from_forgery with: :null_session
    end
end