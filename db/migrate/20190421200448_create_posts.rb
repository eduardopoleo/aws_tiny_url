class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.text :body
      t.text :title
      t.timestamps
    end

    drop_table :urls
  end
end