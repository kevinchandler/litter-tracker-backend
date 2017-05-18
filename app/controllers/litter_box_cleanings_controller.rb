class LitterBoxCleaningsController < ApplicationController
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
end
