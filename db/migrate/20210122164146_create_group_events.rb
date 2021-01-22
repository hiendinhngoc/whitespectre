class CreateGroupEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :group_events do |t|
      t.datetime :start_time
      t.datetime :end_time
      t.integer :duration
      t.string :name
      t.text :description
      t.string :location
      t.string :status, default: 'draft'

      t.timestamps
    end
  end
end
