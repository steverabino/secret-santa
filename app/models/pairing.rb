class Pairing < ApplicationRecord
  belongs_to :santa
  belongs_to :giver, class_name: 'User'
  belongs_to :receiver, class_name: 'User'
end
