class CreateTrips < ActiveRecord::Migration[5.1]
  def change
    create_table :trips do |t|
      t.string :driver
      t.string :state
      t.string :location
      t.datetime :start_at
      t.datetime :completed_at

      t.timestamps
    end
  end
end
