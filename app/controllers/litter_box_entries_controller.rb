class LitterBoxEntriesController < ApplicationController
  before_action :authenticate_private, except: :index
  before_action :authenticate_public, only: :index

  def index
    @litter_box_entries = LitterBoxEntry.select(:created_at).all
    render json: @litter_box_entries.map(&:created_at)
                 .push(paused: Rails.cache.read('paused'))
                 .push(last_cleaned: LitterBoxCleaning.first.try(:created_at))
  end

  def log_event
    render json: @litter_box_entry, status: :accepted
    LitterBoxEntry.create! if LitterBoxEntry.ok_to_create?
  end

  def pause
    render json: { paused: LitterBoxEntry.toggle_logging }, status: :accepted
  end

  def litter_report
    render json: {
        twenty_four_hour: LitterBoxEntry.twenty_four_hour_usage.count,
        total: LitterBoxEntry.count
    }
  end

  private

  def authenticate_public
    key = params[:api_key]
    if key && (key != ENV['API_KEY_PUBLIC'] || key != ENV['API_KEY_PRIVATE'])
      render :forbidden, json: {} and return
    end
  end

  def authenticate_private
    key = params[:api_key]
    if key && (key != ENV['API_KEY_PRIVATE'])
      render :forbidden, json: {} and return
    end
  end
end
