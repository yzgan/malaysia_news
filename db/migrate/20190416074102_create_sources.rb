class CreateSources < ActiveRecord::Migration[5.2]
  def change
    create_table :sources do |t|
      t.string :source_id
      t.string :name

      t.timestamps
    end

    add_reference :articles, :source, index: true, foreign_key: true
  end
end
