class CreateVirtuals < ActiveRecord::Migration[5.2]
  def change
    create_table :virtuals do |t|
      t.string :symbol
      t.integer :user_id
      t.decimal :cost_per
      t.decimal :amount_owned

      t.timestamps
    end
    add_index :virtuals, :user_id
  end
end
