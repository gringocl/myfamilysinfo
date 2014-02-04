class Relationship < ActiveRecord::Base
  belongs_to :user
  belongs_to :family

  scope :father, -> { where(role: 'father')}
end
