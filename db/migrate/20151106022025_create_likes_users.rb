class CreateLikesUsers < ActiveRecord::Migration
  def change
    create_table :likes_users do |t|
      t.references :user, index: true, foreign_key: true
      t.references :post, index: true, foreign_key: true
    end
  end
end
