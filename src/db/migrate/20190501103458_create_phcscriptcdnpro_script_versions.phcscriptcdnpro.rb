# This migration comes from phcscriptcdnpro (originally 20160821183946)
class CreatePhcscriptcdnproScriptVersions < ActiveRecord::Migration[5.2]
  def change

    create_table :phcscriptcdnpro_script_versions do |t|

      t.string :scriptversion

      t.string :slug

      t.string :user_id
      t.string :org_id

      t.timestamps

    end

  end
end
