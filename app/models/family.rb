class Family < ActiveRecord::Base
  has_many :relationships
  has_many :users, through: :relationships
  has_many :kids
  has_many :records, through: :kids
end
