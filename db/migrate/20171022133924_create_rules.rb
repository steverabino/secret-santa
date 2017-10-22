class CreateRules < ActiveRecord::Migration[5.1]
  def change
    create_table :rules do |t|
      t.references :santa, foreign_key: true
      t.references :giver
      t.references :receiver
      t.string :rule

      t.timestamps
    end

    add_foreign_key :rules, :users, column: :giver_id, primary_key: :id
    add_foreign_key :rules, :users, column: :receiver_id, primary_key: :id
  end
end
