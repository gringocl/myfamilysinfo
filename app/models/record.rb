class Record < ActiveRecord::Base
  belongs_to :kid
  has_many :users, through: :kids
  has_many :families, through: :kids
end
