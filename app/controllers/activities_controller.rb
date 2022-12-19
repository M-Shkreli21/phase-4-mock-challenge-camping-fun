class ActivitiesController < ApplicationController

rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_error

    def index
        activities = Activity.all
        render json: activities
    end

    def destroy
        destroy_activity = find_activity
        destroy_activity.destroy
        render json: {}
    end

    private

    def find_activity
        Activity.find(params[:id])
    end

    def render_not_found_error
        render json: { error: "Activity not found" }, status: :not_found
    end
end
