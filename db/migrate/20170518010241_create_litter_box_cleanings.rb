class CreateLitterBoxCleanings < ActiveRecord::Migration[5.0]
  def change
    create_table :litter_box_cleanings do |t|

      t.timestamps
    end
  end
end
