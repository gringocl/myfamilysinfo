class CreateKids < ActiveRecord::Migration
  def change
    create_table :kids do |t|
      t.string :name
      t.references :family, index: true

      t.timestamps
    end
  end
end
