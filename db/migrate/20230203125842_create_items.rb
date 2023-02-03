class CreateItems < ActiveRecord::Migration[7.0]
  def change
    create_table :items do |t|
      t.integer :sender_id
      t.integer :receiver_id
      t.string :recever_name
      t.string :data
      t.string :url
      t.string :content

      t.timestamps
    end
  end
end
