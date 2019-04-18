class CreateResources < ActiveRecord::Migration[5.2]
  def change
    create_table :resources do |t|
      t.string :source_id
      t.string :name

      t.timestamps
    end

    add_reference :articles, :resource, index: true, foreign_key: true
  end
end
