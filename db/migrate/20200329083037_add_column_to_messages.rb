class AddColumnToMessages < ActiveRecord::Migration
  def change
    add_column :messages, :message_title, :string
  end
end
