class LitterBoxEntry < ApplicationRecord
  default_scope { order(created_at: :desc) }
  scope :last_entry, -> { LitterBoxEntry.first }
  scope :twenty_four_hour_usage, -> {
      LitterBoxEntry.where('created_at >= ?', 24.hours.ago)
  }

  CREATE_ENTRY_EVERY = 2

  # dont log on:
  # paused by admin
  # last entry created within CREATE_ENTRY_EVERY interval
  def self.ok_to_create?
    last_entry = self.last_entry
    return false if self.logging_paused?
    return true unless last_entry
    if last_entry.kind_of?(LitterBoxEntry::ActiveRecord_Relation) &&
      last_entry.empty?
      return true
    end
    return last_entry.created_at < CREATE_ENTRY_EVERY.minutes.ago
  end

  def self.toggle_logging
    paused = Rails.cache.read('paused') || false
    val = paused ? false : true
    Rails.cache.write('paused', val, expires_in: 1.hour)
    val
  end

  def self.logging_paused?
    Rails.cache.read('paused') && true || false
  end
end
