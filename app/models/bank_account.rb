class BankAccount < ApplicationRecord
  belongs_to :user
  validates_presence_of :name, :account_number
  validates_uniqueness_of :account_number, message: 'Your account number needs to be unique'
end
