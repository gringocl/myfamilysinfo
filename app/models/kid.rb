class Kid < ActiveRecord::Base
  belongs_to :relationship
  has_many :users, through: :relationship
  has_many :records
end
