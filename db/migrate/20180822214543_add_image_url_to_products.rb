class AddImageUrlToProducts < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :image_url, :string, default: 'https://proxy.duckduckgo.com/iu/?u=http%3A%2F%2F3.bp.blogspot.com%2F-KK6yWHp9fIw%2FUHbPLNIsJTI%2FAAAAAAAAEew%2FVk3b-HHcsNo%2Fs1600%2Fcute-baby-kittens-2.jpg&f=1'
  end
end
