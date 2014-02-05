class Kid < ActiveRecord::Base
  has_many :relationships
  has_many :users, through: :relationships
  has_many :records
  accepts_nested_attributes_for :relationships
end
