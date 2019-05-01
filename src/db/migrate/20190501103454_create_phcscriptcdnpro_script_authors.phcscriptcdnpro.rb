# This migration comes from phcscriptcdnpro (originally 20160821183714)
class CreatePhcscriptcdnproScriptAuthors < ActiveRecord::Migration[5.2]
  def change

    create_table :phcscriptcdnpro_script_authors do |t|

      t.string :authorfirstname
      t.string :authorlastname

      t.string :authorwebsite
      t.string :authorgithub

      t.string :slug

      t.string :user_id
      t.string :org_id

      t.timestamps

    end

  end
end
