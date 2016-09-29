class CreateVisitedUrls < ActiveRecord::Migration
  def change
    create_table :visited_urls do |t|
      t.integer :visitor_id, null: false
      t.string :shortened_url, null: false
      t.timestamps
    end
    add_index :visited_urls, :visitor_id
    add_index :visited_urls, :shortened_url
  end
end
