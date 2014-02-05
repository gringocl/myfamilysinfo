class ChangeRecordsToReminders < ActiveRecord::Migration
  def change
    drop_table :records
    create_table :reminders do |t|
      t.string :name
      t.references :kid, index: true

      t.timestamps
    end
  end
end
