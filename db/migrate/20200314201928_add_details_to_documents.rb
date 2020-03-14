class AddDetailsToDocuments < ActiveRecord::Migration
  def change
    add_column :documents, :s3_identifier, :string
  end
end
