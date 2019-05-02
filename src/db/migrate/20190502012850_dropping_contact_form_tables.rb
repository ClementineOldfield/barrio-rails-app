class DroppingContactFormTables < ActiveRecord::Migration[5.2]
  def change
  end

  def def down 
    drop_table :phcscriptcdnpro_author_versions
    drop_table :phcscriptcdnpro_extension_versions
    drop_table :phcscriptcdnpro_friendly_id_slugs
    drop_table :phcscriptcdnpro_license_versions
    drop_table :phcscriptcdnpro_listing_versions
    drop_table :phcscriptcdnpro_script_authors
    drop_table :phcscriptcdnpro_script_extensions
    drop_table :phcscriptcdnpro_script_licences
    drop_table :phcscriptcdnpro_script_urls
    drop_table :phcscriptcdnpro_script_versions
    drop_table :phcscriptcdnpro_scriptversion_versions
    drop_table :phcscriptcdnpro_url_versions
  end
end
