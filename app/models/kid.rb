class Kid < ActiveRecord::Base
  belongs_to :family
  has_many :users, through: :family
  has_many :records
end
