class LitterBoxEntriesController < ApplicationController

  def index
    @litter_box_entries = LitterBoxEntry.select(:created_at).all
    render json: @litter_box_entries.map(&:created_at)
                 .push(paused: Rails.cache.read('paused'))
  end

  def log_event
    render json: @litter_box_entry, status: :accepted
    LitterBoxEntry.create! if LitterBoxEntry.ok_to_create?
  end

  def pause
    render json: {}, status: :accepted
    LitterBoxEntry.toggle_logging
  end

  def litter_report
    render json: {
        twenty_four_hour: LitterBoxEntry.twenty_four_hour_usage.count,
        total: LitterBoxEntry.count
    }
  end

end
