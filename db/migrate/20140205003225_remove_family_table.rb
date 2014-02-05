class RemoveFamilyTable < ActiveRecord::Migration
  def change
    drop_table :families
  end
end
