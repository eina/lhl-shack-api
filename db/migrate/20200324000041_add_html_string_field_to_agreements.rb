class AddHtmlStringFieldToAgreements < ActiveRecord::Migration
  def change
    add_column :agreements, :html_string, :text
  end
end
