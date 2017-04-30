class LitterBoxEntriesController < ApplicationController

  def index
    @litter_box_entries = LitterBoxEntry.select(:created_at).all
    render json: @litter_box_entries.map(&:created_at)
  end

  def log_event
    render json: @litter_box_entry, status: :accepted
    LitterBoxEntry.create! if LitterBoxEntry.ok_to_create?
  end

  def pause
    render json: {}, status: :accepted
    LitterBoxEntry.pause_logging(true)
  end

  def resume
    render json: {}, status: :accepted
    LitterBoxEntry.pause_logging(false)
  end
end
