class CreatePairings < ActiveRecord::Migration[5.1]
  def change
    create_table :pairings do |t|
      t.references :santa, foreign_key: true
      t.references :giver
      t.references :receiver
      t.string :status

      t.timestamps
    end

    add_foreign_key :pairings, :users, column: :giver_id, primary_key: :id
    add_foreign_key :pairings, :users, column: :receiver_id, primary_key: :id
  end
end
