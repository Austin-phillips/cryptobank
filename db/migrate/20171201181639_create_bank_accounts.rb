class CreateBankAccounts < ActiveRecord::Migration[5.1]
  def change
    create_table :bank_accounts do |t|
      t.string :name, null: false
      t.float :balance, default: 0.0
      t.integer :account_number, null: false
      t.boolean :active, default: true
      t.belongs_to :user, foreign_key: true

      t.timestamps
    end
  end
end
