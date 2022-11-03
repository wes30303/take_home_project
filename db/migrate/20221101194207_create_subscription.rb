class CreateSubscription < ActiveRecord::Migration[6.0]
  def change
    create_table :subscriptions do |t|
      t.references :customer, foreign_key: true
      t.references :tea, foreign_key: true
      t.string :title
      t.integer :price
      t.string :status
      t.string :frequency
    end
  end
end
