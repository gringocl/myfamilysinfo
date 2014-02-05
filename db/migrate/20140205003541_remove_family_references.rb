class RemoveFamilyReferences < ActiveRecord::Migration
  def change
    remove_reference :relationships, :family
    remove_reference :kids, :family
  end
end
