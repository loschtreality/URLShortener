class EditVisitedUrls < ActiveRecord::Migration
  def change
    remove_column :visited_urls,:shortened_url
    add_column :visited_urls, :shortened_url_id, :integer
  end
end
