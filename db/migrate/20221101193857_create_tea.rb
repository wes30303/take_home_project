class CreateTea < ActiveRecord::Migration[6.0]
  def change
    create_table :teas do |t|
      t.string :title
      t.string :description
      t.string :temperature
      t.string :brew_time
    end
  end
end
