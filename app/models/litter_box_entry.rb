class LitterBoxEntry < ApplicationRecord
  default_scope { order(created_at: :desc) }
  scope :last_entry, -> { LitterBoxEntry.first }

  CREATE_ENTRY_EVERY = 2

  def self.ok_to_create?
    last_entry = self.last_entry
    return true unless last_entry
    if last_entry.kind_of?(LitterBoxEntry::ActiveRecord_Relation) &&
      last_entry.empty?
      return true
    end
    return last_entry.created_at < CREATE_ENTRY_EVERY.minutes.ago
  end
end
