class AddImageUrlToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :image_url, :string, default: 'https://pbs.twimg.com/media/CQBEIIxWUAEeVs5.png'
  end
end
