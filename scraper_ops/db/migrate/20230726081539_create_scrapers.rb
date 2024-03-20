class CreateScrapers < ActiveRecord::Migration[7.0]
  def change
    create_table :scrapers do |t|
      t.string :url, null: false
      t.integer :state, default: 0, null: false
      t.string :status

      t.timestamps
    end
  end
end
