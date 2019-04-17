class CreateArticles < ActiveRecord::Migration[5.2]
  def change
    create_table :articles do |t|
      t.string :author
      t.string :title
      t.string :description
      t.string :url
      t.string :url_to_image
      t.datetime :published_at
      t.text :content
      t.references :search, foreign_key: true

      t.timestamps
    end
  end
end
