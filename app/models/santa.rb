class Santa < ApplicationRecord
  has_many :participants
  has_many :users, through: :participants
  has_many :pairings
  has_many :rules
end
