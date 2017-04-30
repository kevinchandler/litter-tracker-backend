class LitterBoxEntriesController < ApplicationController
  before_action :set_litter_box_entry, only: [:show, :update, :destroy]

  # GET /litter_box_entries
  def index
    @litter_box_entries = LitterBoxEntry.all

    render json: @litter_box_entries
  end

  def create
    @litter_box_entry = LitterBoxEntry.new(litter_box_entry_params)

    if @litter_box_entry.save
      render json: @litter_box_entry, status: :created
    else
      render json: @litter_box_entry.errors, status: :unprocessable_entity
    end
  end

end
