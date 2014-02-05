class Record < ActiveRecord::Base
  belongs_to :kid
  has_many :users, through: :kids
end
