class CreateLitterBoxEntries < ActiveRecord::Migration[5.0]
  def change
    create_table :litter_box_entries do |t|

      t.timestamps
    end
  end
end
