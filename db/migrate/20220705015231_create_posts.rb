class CreatePosts < ActiveRecord::Migration[7.0]
  def change
    create_table :posts do |t|
      t.string     :uuid,      null: false, limit: 129, default: ""
      t.string     :title,     null: false, limit: 300
      t.text       :content,   null: false
      t.references :user,      foreign_key: true

      t.timestamps
    end
  end
end
