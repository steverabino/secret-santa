class Participant < ApplicationRecord
  belongs_to :user
  belongs_to :santa
end
