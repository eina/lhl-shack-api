class ChangeMessagesColumnNameToMessageText < ActiveRecord::Migration
  def change
    rename_column :messages, :messages, :message_text    
  end
end
