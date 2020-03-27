class AddLinkColumnToAgreements < ActiveRecord::Migration
  def change
    add_column :agreements, :pdf_link, :string
  end
end
