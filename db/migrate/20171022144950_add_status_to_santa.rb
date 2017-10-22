class AddStatusToSanta < ActiveRecord::Migration[5.1]
  def change
    add_column :santas, :status, :string
  end
end
