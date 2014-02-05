class AddKidsToRelationship < ActiveRecord::Migration
  def change
    add_reference :relationships, :kid, index: true
  end
end
