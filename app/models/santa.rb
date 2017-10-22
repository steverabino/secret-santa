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

  def remove_user(user)
    return unless users.include? user

    participants.find_by(user: user).destroy

    pairings.where(giver: user).or(pairings.where(receiver: user)).destroy_all

    rules.where(giver: user).or(rules.where(receiver: user)).destroy_all

    # Will need to re-enforce all rules!
    # enforce_all_rules
  end

  def enforce_all_rules
    begin rules.order(updated_at: :asc).each(&:enforce)
    rescue ImpossibleRulesetError
      status = 'impossible'
    end
  end
end
