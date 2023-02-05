class ChangeReceiver < ActiveRecord::Migration[7.0]
  def change
    rename_column :items, :recever_name, :receiver_name
  end
end
