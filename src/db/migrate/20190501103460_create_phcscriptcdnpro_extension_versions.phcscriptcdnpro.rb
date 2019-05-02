# This migration comes from phcscriptcdnpro (originally 20170517064030)
class CreatePhcscriptcdnproExtensionVersions < ActiveRecord::Migration[5.2]
  TEXT_BYTES = 1_073_741_823
  def change

    create_table :phcscriptcdnpro_extension_versions do |t|
      t.string   :item_type, {:null=>false}
      t.integer  :item_id,   null: false
      t.string   :event,     null: false
      t.string   :whodunnit
      t.text     :object, limit: TEXT_BYTES
      t.datetime :created_at
    end

    add_index :phcscriptcdnpro_extension_versions, %i(item_type item_id), :name => 'scriptcdnpro_ext_versions'

  end
end
