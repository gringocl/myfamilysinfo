class CreateRelationships < ActiveRecord::Migration
  def change
    create_table :relationships do |t|
      t.references :family, index: true
      t.references :user, index: true
      t.string :role

      t.timestamps
    end
  end
end
