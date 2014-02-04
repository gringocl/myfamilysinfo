class CreateRecords < ActiveRecord::Migration
  def change
    create_table :records do |t|
      t.string :name
      t.references :kid, index: true

      t.timestamps
    end
  end
end
