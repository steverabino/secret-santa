class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :participants
  has_many :santas, through: :participants

  has_many :givers, class_name: 'Pairing', foreign_key: 'giver_id'
  has_many :receivers, class_name: 'Pairing', foreign_key: 'receiver_id'

  has_many :giving_rules, class_name: 'Rule', foreign_key: 'giver_id'
  has_many :receiving_rules, class_name: 'Rule', foreign_key: 'receiver_id'
end
