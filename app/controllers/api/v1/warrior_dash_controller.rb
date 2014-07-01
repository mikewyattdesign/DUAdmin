module Api
    module V1
        class WarriorDashController < ApiController
            respond_to :json

            # POST /api/warriordash
            def create
                data = params[:warrior_dash]
                submission = EntryForm.new(data)
                submission.process
                render json: submission.result.to_json, status: 201
            end

        end
    end
end