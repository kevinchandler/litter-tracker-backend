class LitterBoxCleaningsController < ApplicationController
  before_action :authenticate_private

  def clean
    if LitterBoxCleaning.ok_to_create?
      LitterBoxCleaning.create
      render json: {
        cleaning_count: LitterBoxCleaning.count,
        last_cleaned: LitterBoxCleaning.first.created_at
      }
    else
      render status: :accepted
    end
  end

  private

  def authenticate_private
    key = params[:api_key]
    if key && key != ENV['API_KEY_PRIVATE']
      render :forbidden, json: {} and return
    end
  end
end
