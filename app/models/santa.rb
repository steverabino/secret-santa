class Santa < ApplicationRecord
  has_many :participants
  has_many :users, through: :participants
  has_many :pairings
  has_many :rules

  def add_user(user)
    users << user

    users.each do |u|
      next if user == u

      pairings.create(giver: u, receiver: user, status: 'open')
      pairings.create(giver: user, receiver: u, status: 'open')

      # Will need to re-enforce all rules!
      # enforce_all_rules
    end
  end

  def enforce_all_rules
    rules.order!(updated_at: :desc).each(&:enforce)
  end
end
