module Api
    module V1
        class WarriorDashController < ApiController
            respond_to :json

            # POST /api/warriordash
            def create
                head :ok
            end

        end
    end
end