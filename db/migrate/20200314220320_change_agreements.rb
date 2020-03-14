class ChangeAgreements < ActiveRecord::Migration
  enable_extension 'pgcrypto' unless extension_enabled?('pgcrypto')

  def change
    change_table :households, id: :uuid, default: 'gen_random_uuid()' do |t|      
    end
  end
end