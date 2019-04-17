class CreateSearches < ActiveRecord::Migration[5.2]
  def change
    create_table :searches do |t|
      t.integer :status
      t.integer :total_results

      t.timestamps
    end
  end
end
