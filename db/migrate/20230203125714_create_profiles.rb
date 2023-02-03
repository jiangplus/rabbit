class CreateProfiles < ActiveRecord::Migration[7.0]
  def change
    create_table :profiles do |t|
      t.string :username
      t.string :auth_token
      t.string :auth_data

      t.timestamps
    end
  end
end
