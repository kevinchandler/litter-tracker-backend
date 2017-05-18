class LitterBoxCleaning < ApplicationRecord
	default_scope { order(created_at: :desc) }
	scope :last_entry, -> { LitterBoxCleaning.first }
	before_create :pause_logging

	CREATE_ENTRY_EVERY = 1 # hour

	private

	def pause_logging
		Rails.cache.write('paused', true,
				  expires_in: 15.minutes)
	end

	def self.ok_to_create?
    last_entry = self.last_entry
    return true unless last_entry
    if last_entry.kind_of?(LitterBoxCleaning::ActiveRecord_Relation) &&
				last_entry.empty?
      return true
    end
    return last_entry.created_at < CREATE_ENTRY_EVERY.hours.ago
  end
end
