class SignupsController < ApplicationController

    rescue_from ActiveRecord::RecordInvalid, with: :render_invalid_error_signup

    def create
        new_signup = Signup.create!(signup_params)
        render json: new_signup.activity, status: :created
    end

    private

    def signup_params
        params.permit(:time, :camper_id, :activity_id)
    end

    def render_invalid_error_signup(invalid)
        render json: { errors: invalid.record.errors.full_messages }, status: :unprocessable_entity
    end
end
