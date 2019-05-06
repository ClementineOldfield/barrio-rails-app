# This migration comes from phcscriptcdnpro (originally 20160821183830)
class CreatePhcscriptcdnproScriptUrls < ActiveRecord::Migration[5.2]
  def change

    create_table :phcscriptcdnpro_script_urls do |t|

      t.string :scripturl
      t.date :scripturlrelease
      t.date :scripturlcdnupdate

      t.string :slug

      t.string :user_id
      t.string :org_id

      t.references :listing
      t.references :version
      t.references :extension

      t.timestamps

    end

  end
end
