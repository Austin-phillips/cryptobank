class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Associations
  has_many :bank_accounts, dependent: :destroy
  # Validations
  # Instance Methods
  # Class Methods (Scopes)
  def self.by_email
    order(:email)
  end
  # Callbacks
  # before_create

  after_create :default_bank_account

  private
  
    def default_bank_account
      account_number = rand(5000...1000000)
      if BankAccount.find_by(account_number: account_number)
        default_bank_account
      else
        self.bank_accounts.create(name: 'Default Account', account_number: account_number)
      end
    end
  # after_create
  # before_save
  # after_save
  # before_validation
  # after_validation
end
