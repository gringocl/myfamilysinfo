class Relationship < ActiveRecord::Base
  belongs_to :user
  belongs_to :kid

  scope :father, -> { where(role: 'father')}
end
