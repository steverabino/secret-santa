class CreateSantas < ActiveRecord::Migration[5.1]
  def change
    create_table :santas do |t|
      t.string :name

      t.timestamps
    end
  end
end
