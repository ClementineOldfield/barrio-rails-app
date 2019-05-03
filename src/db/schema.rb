# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2019_05_03_002832) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "addresses", force: :cascade do |t|
    t.bigint "user_id"
    t.string "street_1"
    t.string "street_2"
    t.string "suburb"
    t.integer "state"
    t.integer "postcode"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float "latitude"
    t.float "longitude"
    t.index ["user_id"], name: "index_addresses_on_user_id"
  end

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "favourites", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "listing_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["listing_id"], name: "index_favourites_on_listing_id"
    t.index ["user_id"], name: "index_favourites_on_user_id"
  end

  create_table "images", force: :cascade do |t|
    t.string "url"
    t.string "imageable_type"
    t.bigint "imageable_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["imageable_type", "imageable_id"], name: "index_images_on_imageable_type_and_imageable_id"
  end

  create_table "listings", force: :cascade do |t|
    t.bigint "user_id"
    t.string "title"
    t.text "body"
    t.integer "price"
    t.bigint "category_id"
    t.integer "quantity"
    t.boolean "is_available"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_listings_on_category_id"
    t.index ["user_id"], name: "index_listings_on_user_id"
  end

  create_table "phcscriptcdnpro_author_versions", force: :cascade do |t|
    t.string "item_type", null: false
    t.integer "item_id", null: false
    t.string "event", null: false
    t.string "whodunnit"
    t.text "object"
    t.datetime "created_at"
    t.index ["item_type", "item_id"], name: "scriptcdnpro_author_versions"
  end

  create_table "phcscriptcdnpro_extension_versions", force: :cascade do |t|
    t.string "item_type", null: false
    t.integer "item_id", null: false
    t.string "event", null: false
    t.string "whodunnit"
    t.text "object"
    t.datetime "created_at"
    t.index ["item_type", "item_id"], name: "scriptcdnpro_ext_versions"
  end

  create_table "phcscriptcdnpro_friendly_id_slugs", force: :cascade do |t|
    t.string "slug", null: false
    t.integer "sluggable_id", null: false
    t.string "sluggable_type", limit: 50
    t.string "scope"
    t.datetime "created_at"
    t.index ["slug", "sluggable_type", "scope"], name: "scriptcdnpro_fri_id_slugable_scope_type", unique: true
    t.index ["slug", "sluggable_type"], name: "scriptcdnpro_fri_id_slugable_type"
    t.index ["sluggable_id"], name: "index_phcscriptcdnpro_friendly_id_slugs_on_sluggable_id"
    t.index ["sluggable_type"], name: "index_phcscriptcdnpro_friendly_id_slugs_on_sluggable_type"
  end

  create_table "phcscriptcdnpro_licence_versions", force: :cascade do |t|
    t.string "item_type", null: false
    t.integer "item_id", null: false
    t.string "event", null: false
    t.string "whodunnit"
    t.text "object"
    t.datetime "created_at"
    t.index ["item_type", "item_id"], name: "scriptcdnpro_licence_versions"
  end

  create_table "phcscriptcdnpro_listing_versions", force: :cascade do |t|
    t.string "item_type", null: false
    t.integer "item_id", null: false
    t.string "event", null: false
    t.string "whodunnit"
    t.text "object"
    t.datetime "created_at"
    t.index ["item_type", "item_id"], name: "scriptcdnpro_listing_versions"
  end

  create_table "phcscriptcdnpro_script_authors", force: :cascade do |t|
    t.string "authorfirstname"
    t.string "authorlastname"
    t.string "authorwebsite"
    t.string "authorgithub"
    t.string "slug"
    t.string "user_id"
    t.string "org_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "phcscriptcdnpro_script_extensions", force: :cascade do |t|
    t.string "scriptextensionname"
    t.text "scriptextensiondes"
    t.string "scriptextension"
    t.string "slug"
    t.string "user_id"
    t.string "org_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "phcscriptcdnpro_script_licences", force: :cascade do |t|
    t.string "lcncname"
    t.string "lcncdescript"
    t.text "lcncdescription"
    t.string "lcnccomgpl"
    t.string "lcncarvlfsf"
    t.string "lcncarvlosi"
    t.string "lcncarvlcopyfree"
    t.string "lcncarvldebian"
    t.string "lcncarvlfedora"
    t.string "slug"
    t.string "user_id"
    t.string "org_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "phcscriptcdnpro_script_listings", force: :cascade do |t|
    t.string "scripttitle"
    t.text "scriptdescription"
    t.string "descriptionsource"
    t.string "scriptwebsite"
    t.string "scriptgithub"
    t.date "scriptinitialrelease"
    t.date "scriptlastestrelease"
    t.date "scriptbetarelease"
    t.date "scriptlastestreleasecdn"
    t.string "scriptstatus"
    t.string "slug"
    t.string "user_id"
    t.string "org_id"
    t.bigint "version_id"
    t.bigint "licence_id"
    t.bigint "author_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["author_id"], name: "index_phcscriptcdnpro_script_listings_on_author_id"
    t.index ["licence_id"], name: "index_phcscriptcdnpro_script_listings_on_licence_id"
    t.index ["version_id"], name: "index_phcscriptcdnpro_script_listings_on_version_id"
  end

  create_table "phcscriptcdnpro_script_urls", force: :cascade do |t|
    t.string "scripturl"
    t.date "scripturlrelease"
    t.date "scripturlcdnupdate"
    t.string "slug"
    t.string "user_id"
    t.string "org_id"
    t.bigint "listing_id"
    t.bigint "version_id"
    t.bigint "extension_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["extension_id"], name: "index_phcscriptcdnpro_script_urls_on_extension_id"
    t.index ["listing_id"], name: "index_phcscriptcdnpro_script_urls_on_listing_id"
    t.index ["version_id"], name: "index_phcscriptcdnpro_script_urls_on_version_id"
  end

  create_table "phcscriptcdnpro_script_versions", force: :cascade do |t|
    t.string "scriptversion"
    t.string "slug"
    t.string "user_id"
    t.string "org_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "phcscriptcdnpro_scriptversion_versions", force: :cascade do |t|
    t.string "item_type", null: false
    t.integer "item_id", null: false
    t.string "event", null: false
    t.string "whodunnit"
    t.text "object"
    t.datetime "created_at"
    t.index ["item_type", "item_id"], name: "scriptcdnpro_scriptversion_versions"
  end

  create_table "phcscriptcdnpro_url_versions", force: :cascade do |t|
    t.string "item_type", null: false
    t.integer "item_id", null: false
    t.string "event", null: false
    t.string "whodunnit"
    t.text "object"
    t.datetime "created_at"
    t.index ["item_type", "item_id"], name: "scriptcdnpro_url_versions"
  end

  create_table "purchases", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "listing_id"
    t.integer "total_amount"
    t.integer "quantity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["listing_id"], name: "index_purchases_on_listing_id"
    t.index ["user_id"], name: "index_purchases_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.text "bio"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "addresses", "users"
  add_foreign_key "favourites", "listings"
  add_foreign_key "favourites", "users"
  add_foreign_key "listings", "categories"
  add_foreign_key "listings", "users"
  add_foreign_key "purchases", "listings"
  add_foreign_key "purchases", "users"
end
