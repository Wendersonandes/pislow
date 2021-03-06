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

ActiveRecord::Schema.define(version: 20170424110030) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "alchemy_attachments", force: :cascade do |t|
    t.string   "name"
    t.string   "file_name"
    t.string   "file_mime_type"
    t.integer  "file_size"
    t.integer  "creator_id"
    t.integer  "updater_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.text     "cached_tag_list"
    t.string   "file_uid"
    t.index ["file_uid"], name: "index_alchemy_attachments_on_file_uid", using: :btree
  end

  create_table "alchemy_cells", force: :cascade do |t|
    t.integer  "page_id",    null: false
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["page_id"], name: "index_alchemy_cells_on_page_id", using: :btree
  end

  create_table "alchemy_contents", force: :cascade do |t|
    t.string   "name"
    t.string   "essence_type", null: false
    t.integer  "essence_id",   null: false
    t.integer  "element_id",   null: false
    t.integer  "position"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.integer  "creator_id"
    t.integer  "updater_id"
    t.index ["element_id", "position"], name: "index_contents_on_element_id_and_position", using: :btree
    t.index ["essence_id", "essence_type"], name: "index_alchemy_contents_on_essence_id_and_essence_type", unique: true, using: :btree
  end

  create_table "alchemy_elements", force: :cascade do |t|
    t.string   "name"
    t.integer  "position"
    t.integer  "page_id",                           null: false
    t.boolean  "public",            default: true
    t.boolean  "folded",            default: false
    t.boolean  "unique",            default: false
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
    t.integer  "creator_id"
    t.integer  "updater_id"
    t.integer  "cell_id"
    t.text     "cached_tag_list"
    t.integer  "parent_element_id"
    t.index ["cell_id"], name: "index_alchemy_elements_on_cell_id", using: :btree
    t.index ["page_id", "parent_element_id"], name: "index_alchemy_elements_on_page_id_and_parent_element_id", using: :btree
    t.index ["page_id", "position"], name: "index_elements_on_page_id_and_position", using: :btree
  end

  create_table "alchemy_elements_alchemy_pages", id: false, force: :cascade do |t|
    t.integer "element_id"
    t.integer "page_id"
  end

  create_table "alchemy_essence_booleans", force: :cascade do |t|
    t.boolean  "value"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "creator_id"
    t.integer  "updater_id"
    t.index ["value"], name: "index_alchemy_essence_booleans_on_value", using: :btree
  end

  create_table "alchemy_essence_dates", force: :cascade do |t|
    t.datetime "date"
    t.integer  "creator_id"
    t.integer  "updater_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "alchemy_essence_files", force: :cascade do |t|
    t.integer  "attachment_id"
    t.string   "title"
    t.string   "css_class"
    t.integer  "creator_id"
    t.integer  "updater_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.string   "link_text"
    t.index ["attachment_id"], name: "index_alchemy_essence_files_on_attachment_id", using: :btree
  end

  create_table "alchemy_essence_htmls", force: :cascade do |t|
    t.text     "source"
    t.integer  "creator_id"
    t.integer  "updater_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "alchemy_essence_links", force: :cascade do |t|
    t.string   "link"
    t.string   "link_title"
    t.string   "link_target"
    t.string   "link_class_name"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.integer  "creator_id"
    t.integer  "updater_id"
  end

  create_table "alchemy_essence_pictures", force: :cascade do |t|
    t.integer  "picture_id"
    t.string   "caption"
    t.string   "title"
    t.string   "alt_tag"
    t.string   "link"
    t.string   "link_class_name"
    t.string   "link_title"
    t.string   "css_class"
    t.string   "link_target"
    t.integer  "creator_id"
    t.integer  "updater_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "crop_from"
    t.string   "crop_size"
    t.string   "render_size"
    t.index ["picture_id"], name: "index_alchemy_essence_pictures_on_picture_id", using: :btree
  end

  create_table "alchemy_essence_richtexts", force: :cascade do |t|
    t.text     "body"
    t.text     "stripped_body"
    t.boolean  "public"
    t.integer  "creator_id"
    t.integer  "updater_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "alchemy_essence_selects", force: :cascade do |t|
    t.string   "value"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "creator_id"
    t.integer  "updater_id"
    t.index ["value"], name: "index_alchemy_essence_selects_on_value", using: :btree
  end

  create_table "alchemy_essence_spree_products", force: :cascade do |t|
    t.integer "spree_product_id"
    t.index ["spree_product_id"], name: "index_alchemy_essence_spree_products_on_spree_product_id", using: :btree
  end

  create_table "alchemy_essence_spree_taxons", force: :cascade do |t|
    t.integer  "taxon_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["taxon_id"], name: "index_alchemy_essence_spree_taxons_on_taxon_id", using: :btree
  end

  create_table "alchemy_essence_texts", force: :cascade do |t|
    t.text     "body"
    t.string   "link"
    t.string   "link_title"
    t.string   "link_class_name"
    t.boolean  "public",          default: false
    t.string   "link_target"
    t.integer  "creator_id"
    t.integer  "updater_id"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
  end

  create_table "alchemy_folded_pages", force: :cascade do |t|
    t.integer "page_id",                 null: false
    t.integer "user_id",                 null: false
    t.boolean "folded",  default: false
    t.index ["page_id", "user_id"], name: "index_alchemy_folded_pages_on_page_id_and_user_id", unique: true, using: :btree
  end

  create_table "alchemy_languages", force: :cascade do |t|
    t.string   "name"
    t.string   "language_code"
    t.string   "frontpage_name"
    t.string   "page_layout",    default: "intro"
    t.boolean  "public",         default: false
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
    t.integer  "creator_id"
    t.integer  "updater_id"
    t.boolean  "default",        default: false
    t.string   "country_code",   default: "",      null: false
    t.integer  "site_id",                          null: false
    t.string   "locale"
    t.index ["language_code", "country_code"], name: "index_alchemy_languages_on_language_code_and_country_code", using: :btree
    t.index ["language_code"], name: "index_alchemy_languages_on_language_code", using: :btree
    t.index ["site_id"], name: "index_alchemy_languages_on_site_id", using: :btree
  end

  create_table "alchemy_legacy_page_urls", force: :cascade do |t|
    t.string   "urlname",    null: false
    t.integer  "page_id",    null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["page_id"], name: "index_alchemy_legacy_page_urls_on_page_id", using: :btree
    t.index ["urlname"], name: "index_alchemy_legacy_page_urls_on_urlname", using: :btree
  end

  create_table "alchemy_pages", force: :cascade do |t|
    t.string   "name"
    t.string   "urlname"
    t.string   "title"
    t.string   "language_code"
    t.boolean  "language_root"
    t.string   "page_layout"
    t.text     "meta_keywords"
    t.text     "meta_description"
    t.integer  "lft"
    t.integer  "rgt"
    t.integer  "parent_id"
    t.integer  "depth"
    t.boolean  "visible",          default: false
    t.integer  "locked_by"
    t.boolean  "restricted",       default: false
    t.boolean  "robot_index",      default: true
    t.boolean  "robot_follow",     default: true
    t.boolean  "sitemap",          default: true
    t.boolean  "layoutpage",       default: false
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
    t.integer  "creator_id"
    t.integer  "updater_id"
    t.integer  "language_id"
    t.text     "cached_tag_list"
    t.datetime "published_at"
    t.datetime "public_on"
    t.datetime "public_until"
    t.datetime "locked_at"
    t.index ["language_id"], name: "index_pages_on_language_id", using: :btree
    t.index ["locked_at", "locked_by"], name: "index_alchemy_pages_on_locked_at_and_locked_by", using: :btree
    t.index ["parent_id", "lft"], name: "index_pages_on_parent_id_and_lft", using: :btree
    t.index ["public_on", "public_until"], name: "index_alchemy_pages_on_public_on_and_public_until", using: :btree
    t.index ["rgt"], name: "index_alchemy_pages_on_rgt", using: :btree
    t.index ["urlname"], name: "index_pages_on_urlname", using: :btree
  end

  create_table "alchemy_pictures", force: :cascade do |t|
    t.string   "name"
    t.string   "image_file_name"
    t.integer  "image_file_width"
    t.integer  "image_file_height"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.integer  "creator_id"
    t.integer  "updater_id"
    t.string   "upload_hash"
    t.text     "cached_tag_list"
    t.string   "image_file_uid"
    t.integer  "image_file_size"
    t.string   "image_file_format"
  end

  create_table "alchemy_sites", force: :cascade do |t|
    t.string   "host"
    t.string   "name"
    t.datetime "created_at",                               null: false
    t.datetime "updated_at",                               null: false
    t.boolean  "public",                   default: false
    t.text     "aliases"
    t.boolean  "redirect_to_primary_host"
    t.index ["host", "public"], name: "alchemy_sites_public_hosts_idx", using: :btree
    t.index ["host"], name: "index_alchemy_sites_on_host", using: :btree
  end

  create_table "delayed_jobs", force: :cascade do |t|
    t.integer  "priority",   default: 0, null: false
    t.integer  "attempts",   default: 0, null: false
    t.text     "handler",                null: false
    t.text     "last_error"
    t.datetime "run_at"
    t.datetime "locked_at"
    t.datetime "failed_at"
    t.string   "locked_by"
    t.string   "queue"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["priority", "run_at"], name: "delayed_jobs_priority", using: :btree
  end

  create_table "friendly_id_slugs", force: :cascade do |t|
    t.string   "slug",                      null: false
    t.integer  "sluggable_id",              null: false
    t.string   "sluggable_type", limit: 50
    t.string   "scope"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true, using: :btree
    t.index ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type", using: :btree
    t.index ["sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_id", using: :btree
    t.index ["sluggable_type"], name: "index_friendly_id_slugs_on_sluggable_type", using: :btree
  end

  create_table "solidus_elastic_product_states", force: :cascade do |t|
    t.integer  "product_id",                                  null: false
    t.text     "json"
    t.boolean  "uploaded",                    default: false, null: false
    t.datetime "locked_for_serialization_at"
    t.datetime "locked_for_upload_at"
    t.index ["json"], name: "index_solidus_elastic_product_states_on_json", where: "(json IS NULL)", using: :btree
    t.index ["locked_for_serialization_at"], name: "index_states_on_locked_for_serialization_at", using: :btree
    t.index ["locked_for_upload_at"], name: "index_solidus_elastic_product_states_on_locked_for_upload_at", using: :btree
    t.index ["product_id"], name: "index_solidus_elastic_product_states_on_product_id", using: :btree
    t.index ["uploaded"], name: "index_solidus_elastic_product_states_on_uploaded", using: :btree
  end

  create_table "solidus_paypal_braintree_configurations", force: :cascade do |t|
    t.boolean  "paypal",      default: false, null: false
    t.boolean  "apple_pay",   default: false, null: false
    t.integer  "store_id",                    null: false
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.boolean  "credit_card", default: false, null: false
    t.index ["store_id"], name: "index_solidus_paypal_braintree_configurations_on_store_id", using: :btree
  end

  create_table "solidus_paypal_braintree_customers", force: :cascade do |t|
    t.integer "user_id"
    t.string  "braintree_customer_id"
    t.index ["braintree_customer_id"], name: "index_braintree_customers_on_braintree_customer_id", unique: true, using: :btree
    t.index ["user_id"], name: "index_braintree_customers_on_user_id", unique: true, using: :btree
  end

  create_table "solidus_paypal_braintree_sources", force: :cascade do |t|
    t.string   "nonce"
    t.string   "token"
    t.string   "payment_type"
    t.integer  "user_id"
    t.integer  "customer_id"
    t.integer  "payment_method_id"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.index ["customer_id"], name: "index_solidus_paypal_braintree_sources_on_customer_id", using: :btree
    t.index ["payment_method_id"], name: "index_solidus_paypal_braintree_sources_on_payment_method_id", using: :btree
    t.index ["user_id"], name: "index_solidus_paypal_braintree_sources_on_user_id", using: :btree
  end

  create_table "solidus_subscriptions_installment_details", force: :cascade do |t|
    t.integer  "installment_id", null: false
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.boolean  "success"
    t.string   "message"
    t.integer  "order_id"
    t.index ["installment_id"], name: "index_installment_details_on_installment_id", using: :btree
    t.index ["order_id"], name: "index_solidus_subscriptions_installment_details_on_order_id", using: :btree
  end

  create_table "solidus_subscriptions_installments", force: :cascade do |t|
    t.integer  "subscription_id", null: false
    t.datetime "actionable_date"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["subscription_id"], name: "index_solidus_subscriptions_installments_on_subscription_id", using: :btree
  end

  create_table "solidus_subscriptions_line_items", force: :cascade do |t|
    t.integer  "spree_line_item_id"
    t.integer  "subscription_id"
    t.integer  "quantity",           null: false
    t.integer  "subscribable_id",    null: false
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.integer  "interval_units"
    t.integer  "interval_length"
    t.date     "end_date"
    t.index ["spree_line_item_id"], name: "index_solidus_subscriptions_line_items_on_spree_line_item_id", using: :btree
    t.index ["subscribable_id"], name: "index_solidus_subscriptions_line_items_on_subscribable_id", using: :btree
    t.index ["subscription_id"], name: "index_line_items_on_subscription_id", using: :btree
    t.index ["subscription_id"], name: "index_solidus_subscriptions_line_items_on_subscription_id", using: :btree
  end

  create_table "solidus_subscriptions_subscriptions", force: :cascade do |t|
    t.datetime "actionable_date"
    t.string   "state"
    t.integer  "user_id"
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
    t.integer  "skip_count",            default: 0, null: false
    t.integer  "successive_skip_count", default: 0, null: false
    t.integer  "store_id"
    t.integer  "shipping_address_id"
    t.integer  "interval_length"
    t.integer  "interval_units"
    t.datetime "end_date"
    t.index ["shipping_address_id"], name: "index_subscription_shipping_address_id", using: :btree
    t.index ["store_id"], name: "index_solidus_subscriptions_subscriptions_on_store_id", using: :btree
    t.index ["user_id"], name: "index_solidus_subscriptions_subscriptions_on_user_id", using: :btree
  end

  create_table "spree_addresses", force: :cascade do |t|
    t.string   "firstname"
    t.string   "lastname"
    t.string   "address1"
    t.string   "address2"
    t.string   "city"
    t.string   "zipcode"
    t.string   "phone"
    t.string   "state_name"
    t.string   "alternative_phone"
    t.string   "company"
    t.integer  "state_id"
    t.integer  "country_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.float    "latitude"
    t.float    "longitude"
    t.integer  "user_id"
    t.datetime "deleted_at"
    t.index ["country_id"], name: "index_spree_addresses_on_country_id", using: :btree
    t.index ["deleted_at"], name: "index_spree_addresses_on_deleted_at", using: :btree
    t.index ["firstname"], name: "index_addresses_on_firstname", using: :btree
    t.index ["lastname"], name: "index_addresses_on_lastname", using: :btree
    t.index ["state_id"], name: "index_spree_addresses_on_state_id", using: :btree
    t.index ["user_id"], name: "index_spree_addresses_on_user_id", using: :btree
  end

  create_table "spree_adjustment_reasons", force: :cascade do |t|
    t.string   "name"
    t.string   "code"
    t.boolean  "active",     default: true
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["active"], name: "index_spree_adjustment_reasons_on_active", using: :btree
    t.index ["code"], name: "index_spree_adjustment_reasons_on_code", using: :btree
  end

  create_table "spree_adjustment_versions", force: :cascade do |t|
    t.string   "item_type",      null: false
    t.integer  "item_id",        null: false
    t.string   "event",          null: false
    t.string   "whodunnit"
    t.text     "object"
    t.text     "object_changes"
    t.datetime "created_at"
    t.index ["item_type", "item_id"], name: "index_spree_adjustment_versions_on_item_type_and_item_id", using: :btree
  end

  create_table "spree_adjustments", force: :cascade do |t|
    t.string   "source_type"
    t.integer  "source_id"
    t.string   "adjustable_type"
    t.integer  "adjustable_id",                                                 null: false
    t.decimal  "amount",               precision: 10, scale: 2
    t.string   "label"
    t.boolean  "eligible",                                      default: true
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "order_id",                                                      null: false
    t.boolean  "included",                                      default: false
    t.integer  "promotion_code_id"
    t.integer  "adjustment_reason_id"
    t.boolean  "finalized",                                     default: false, null: false
    t.index ["adjustable_id", "adjustable_type"], name: "index_spree_adjustments_on_adjustable_id_and_adjustable_type", using: :btree
    t.index ["adjustable_id"], name: "index_adjustments_on_order_id", using: :btree
    t.index ["eligible"], name: "index_spree_adjustments_on_eligible", using: :btree
    t.index ["order_id"], name: "index_spree_adjustments_on_order_id", using: :btree
    t.index ["promotion_code_id"], name: "index_spree_adjustments_on_promotion_code_id", using: :btree
    t.index ["source_id", "source_type"], name: "index_spree_adjustments_on_source_id_and_source_type", using: :btree
  end

  create_table "spree_assemblies_parts", force: :cascade do |t|
    t.integer "assembly_id",             null: false
    t.integer "part_id",                 null: false
    t.integer "count",       default: 1, null: false
  end

  create_table "spree_assets", force: :cascade do |t|
    t.string   "viewable_type"
    t.integer  "viewable_id"
    t.integer  "attachment_width"
    t.integer  "attachment_height"
    t.integer  "attachment_file_size"
    t.integer  "position"
    t.string   "attachment_content_type"
    t.string   "attachment_file_name"
    t.string   "type",                    limit: 75
    t.datetime "attachment_updated_at"
    t.text     "alt"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "digital_asset_id"
    t.index ["digital_asset_id"], name: "index_spree_assets_on_digital_asset_id", using: :btree
    t.index ["viewable_id"], name: "index_assets_on_viewable_id", using: :btree
    t.index ["viewable_type", "type"], name: "index_assets_on_viewable_type_and_type", using: :btree
  end

  create_table "spree_assets_variants", force: :cascade do |t|
    t.integer "image_id"
    t.integer "variant_id"
    t.integer "position"
    t.index ["image_id"], name: "index_spree_assets_variants_on_image_id", using: :btree
    t.index ["variant_id"], name: "index_spree_assets_variants_on_variant_id", using: :btree
  end

  create_table "spree_authentication_methods", force: :cascade do |t|
    t.string   "environment"
    t.string   "provider"
    t.string   "api_key"
    t.string   "api_secret"
    t.boolean  "active"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "spree_barcodes", force: :cascade do |t|
    t.string   "code"
    t.string   "format"
    t.integer  "variant_id"
    t.integer  "product_id"
    t.integer  "position"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "spree_calculators", force: :cascade do |t|
    t.string   "type"
    t.string   "calculable_type"
    t.integer  "calculable_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "preferences"
    t.index ["calculable_id", "calculable_type"], name: "index_spree_calculators_on_calculable_id_and_calculable_type", using: :btree
    t.index ["id", "type"], name: "index_spree_calculators_on_id_and_type", using: :btree
  end

  create_table "spree_cart_events", force: :cascade do |t|
    t.string   "actor_type"
    t.integer  "actor_id"
    t.string   "target_type"
    t.integer  "target_id"
    t.string   "activity"
    t.string   "referrer"
    t.integer  "quantity"
    t.decimal  "total",       precision: 16, scale: 4
    t.string   "session_id"
    t.integer  "variant_id"
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
    t.index ["actor_type", "actor_id"], name: "index_spree_cart_events_on_actor_type_and_actor_id", using: :btree
    t.index ["target_type", "target_id"], name: "index_spree_cart_events_on_target_type_and_target_id", using: :btree
    t.index ["variant_id"], name: "index_spree_cart_events_on_variant_id", using: :btree
  end

  create_table "spree_cartons", force: :cascade do |t|
    t.string   "number"
    t.string   "external_number"
    t.integer  "stock_location_id"
    t.integer  "address_id"
    t.integer  "shipping_method_id"
    t.string   "tracking"
    t.datetime "shipped_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "imported_from_shipment_id"
    t.index ["external_number"], name: "index_spree_cartons_on_external_number", using: :btree
    t.index ["imported_from_shipment_id"], name: "index_spree_cartons_on_imported_from_shipment_id", unique: true, using: :btree
    t.index ["number"], name: "index_spree_cartons_on_number", unique: true, using: :btree
    t.index ["stock_location_id"], name: "index_spree_cartons_on_stock_location_id", using: :btree
  end

  create_table "spree_checkout_events", force: :cascade do |t|
    t.string   "actor_type"
    t.integer  "actor_id"
    t.string   "target_type"
    t.integer  "target_id"
    t.string   "activity"
    t.string   "referrer"
    t.string   "previous_state"
    t.string   "next_state"
    t.string   "session_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.index ["actor_type", "actor_id"], name: "index_spree_checkout_events_on_actor_type_and_actor_id", using: :btree
    t.index ["target_type", "target_id"], name: "index_spree_checkout_events_on_target_type_and_target_id", using: :btree
  end

  create_table "spree_comment_types", force: :cascade do |t|
    t.string   "name"
    t.string   "applies_to"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "spree_comments", force: :cascade do |t|
    t.string   "title",            limit: 50
    t.text     "comment"
    t.string   "commentable_type"
    t.integer  "commentable_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "comment_type_id"
    t.index ["commentable_id"], name: "index_spree_comments_on_commentable_id", using: :btree
    t.index ["commentable_type"], name: "index_spree_comments_on_commentable_type", using: :btree
    t.index ["user_id"], name: "index_spree_comments_on_user_id", using: :btree
  end

  create_table "spree_countries", force: :cascade do |t|
    t.string   "iso_name"
    t.string   "iso"
    t.string   "iso3"
    t.string   "name"
    t.integer  "numcode"
    t.boolean  "states_required", default: false
    t.datetime "updated_at"
    t.datetime "created_at"
    t.index ["iso"], name: "index_spree_countries_on_iso", using: :btree
  end

  create_table "spree_credit_cards", force: :cascade do |t|
    t.string   "month"
    t.string   "year"
    t.string   "cc_type"
    t.string   "last_digits"
    t.string   "gateway_customer_profile_id"
    t.string   "gateway_payment_profile_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
    t.integer  "user_id"
    t.integer  "payment_method_id"
    t.boolean  "default",                     default: false, null: false
    t.integer  "address_id"
    t.text     "data"
    t.index ["payment_method_id"], name: "index_spree_credit_cards_on_payment_method_id", using: :btree
    t.index ["user_id"], name: "index_spree_credit_cards_on_user_id", using: :btree
  end

  create_table "spree_customer_returns", force: :cascade do |t|
    t.string   "number"
    t.integer  "stock_location_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "spree_digital_assets", force: :cascade do |t|
    t.string   "name"
    t.string   "attachment_file_name"
    t.string   "attachment_content_type"
    t.integer  "attachment_file_size"
    t.datetime "attachment_updated_at"
    t.integer  "folder_id"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "spree_feedback_reviews", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "review_id",                 null: false
    t.integer  "rating",     default: 0
    t.text     "comment"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "locale",     default: "en"
    t.index ["review_id"], name: "index_spree_feedback_reviews_on_review_id", using: :btree
    t.index ["user_id"], name: "index_spree_feedback_reviews_on_user_id", using: :btree
  end

  create_table "spree_folders", force: :cascade do |t|
    t.string   "name"
    t.integer  "parent_id"
    t.integer  "lft",        null: false
    t.integer  "rgt",        null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["lft"], name: "index_spree_folders_on_lft", using: :btree
    t.index ["parent_id"], name: "index_spree_folders_on_parent_id", using: :btree
    t.index ["rgt"], name: "index_spree_folders_on_rgt", using: :btree
  end

  create_table "spree_inventory_units", force: :cascade do |t|
    t.string   "state"
    t.integer  "variant_id"
    t.integer  "order_id"
    t.integer  "shipment_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "pending",                        default: true
    t.integer  "line_item_id"
    t.integer  "carton_id"
    t.integer  "legacy_return_authorization_id"
    t.index ["carton_id"], name: "index_spree_inventory_units_on_carton_id", using: :btree
    t.index ["legacy_return_authorization_id"], name: "index_spree_inventory_units_on_legacy_return_authorization_id", using: :btree
    t.index ["line_item_id"], name: "index_spree_inventory_units_on_line_item_id", using: :btree
    t.index ["order_id"], name: "index_inventory_units_on_order_id", using: :btree
    t.index ["shipment_id"], name: "index_inventory_units_on_shipment_id", using: :btree
    t.index ["variant_id"], name: "index_inventory_units_on_variant_id", using: :btree
  end

  create_table "spree_legacy_return_authorizations", force: :cascade do |t|
    t.string   "number"
    t.string   "state"
    t.decimal  "amount",            precision: 10, scale: 2, default: "0.0", null: false
    t.integer  "order_id"
    t.text     "reason"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "stock_location_id"
  end

  create_table "spree_line_item_actions", force: :cascade do |t|
    t.integer  "line_item_id",             null: false
    t.integer  "action_id",                null: false
    t.integer  "quantity",     default: 0
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["action_id"], name: "index_spree_line_item_actions_on_action_id", using: :btree
    t.index ["line_item_id"], name: "index_spree_line_item_actions_on_line_item_id", using: :btree
  end

  create_table "spree_line_item_versions", force: :cascade do |t|
    t.string   "item_type",      null: false
    t.integer  "item_id",        null: false
    t.string   "event",          null: false
    t.string   "whodunnit"
    t.text     "object"
    t.text     "object_changes"
    t.datetime "created_at"
    t.index ["item_type", "item_id"], name: "index_spree_line_item_versions_on_item_type_and_item_id", using: :btree
  end

  create_table "spree_line_items", force: :cascade do |t|
    t.integer  "variant_id"
    t.integer  "order_id"
    t.integer  "quantity",                                                      null: false
    t.decimal  "price",                precision: 10, scale: 2,                 null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.decimal  "cost_price",           precision: 10, scale: 2
    t.integer  "tax_category_id"
    t.decimal  "adjustment_total",     precision: 10, scale: 2, default: "0.0"
    t.decimal  "additional_tax_total", precision: 10, scale: 2, default: "0.0"
    t.decimal  "promo_total",          precision: 10, scale: 2, default: "0.0"
    t.decimal  "included_tax_total",   precision: 10, scale: 2, default: "0.0", null: false
    t.index ["order_id"], name: "index_spree_line_items_on_order_id", using: :btree
    t.index ["variant_id"], name: "index_spree_line_items_on_variant_id", using: :btree
  end

  create_table "spree_log_entries", force: :cascade do |t|
    t.string   "source_type"
    t.integer  "source_id"
    t.text     "details"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["source_id", "source_type"], name: "index_spree_log_entries_on_source_id_and_source_type", using: :btree
  end

  create_table "spree_mega_menu_items", force: :cascade do |t|
    t.integer  "parent_id"
    t.string   "title"
    t.integer  "weight"
    t.string   "link"
    t.string   "type_of_link",            default: "page"
    t.boolean  "top_level"
    t.integer  "mega_menu_id"
    t.string   "css_class"
    t.integer  "column"
    t.string   "menu_image_file_name"
    t.string   "menu_image_content_type"
    t.integer  "menu_image_file_size"
    t.datetime "menu_image_updated_at"
    t.index ["mega_menu_id"], name: "index_spree_mega_menu_items_on_mega_menu_id", using: :btree
    t.index ["parent_id"], name: "index_spree_mega_menu_items_on_parent_id", using: :btree
  end

  create_table "spree_mega_menus", force: :cascade do |t|
    t.string  "name"
    t.boolean "enabled"
  end

  create_table "spree_option_type_prototypes", force: :cascade do |t|
    t.integer  "prototype_id"
    t.integer  "option_type_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "spree_option_types", force: :cascade do |t|
    t.string   "name",         limit: 100
    t.string   "presentation", limit: 100
    t.integer  "position",                 default: 0, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["position"], name: "index_spree_option_types_on_position", using: :btree
  end

  create_table "spree_option_values", force: :cascade do |t|
    t.integer  "position"
    t.string   "name"
    t.string   "presentation"
    t.integer  "option_type_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "delivery_message"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.decimal  "surcharge",          precision: 8, scale: 2, default: "0.0"
    t.index ["option_type_id"], name: "index_spree_option_values_on_option_type_id", using: :btree
    t.index ["position"], name: "index_spree_option_values_on_position", using: :btree
  end

  create_table "spree_option_values_variants", force: :cascade do |t|
    t.integer  "variant_id"
    t.integer  "option_value_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["variant_id", "option_value_id"], name: "index_option_values_variants_on_variant_id_and_option_value_id", using: :btree
    t.index ["variant_id"], name: "index_spree_option_values_variants_on_variant_id", using: :btree
  end

  create_table "spree_order_mutexes", force: :cascade do |t|
    t.integer  "order_id",   null: false
    t.datetime "created_at"
    t.index ["order_id"], name: "index_spree_order_mutexes_on_order_id", unique: true, using: :btree
  end

  create_table "spree_order_stock_locations", force: :cascade do |t|
    t.integer  "order_id"
    t.integer  "variant_id"
    t.integer  "quantity"
    t.integer  "stock_location_id"
    t.boolean  "shipment_fulfilled", default: false, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "spree_order_versions", force: :cascade do |t|
    t.string   "item_type",      null: false
    t.integer  "item_id",        null: false
    t.string   "event",          null: false
    t.string   "whodunnit"
    t.text     "object"
    t.text     "object_changes"
    t.datetime "created_at"
    t.index ["item_type", "item_id"], name: "index_spree_order_versions_on_item_type_and_item_id", using: :btree
  end

  create_table "spree_orders", force: :cascade do |t|
    t.string   "number",                 limit: 32
    t.decimal  "item_total",                        precision: 10, scale: 2, default: "0.0",   null: false
    t.decimal  "total",                             precision: 10, scale: 2, default: "0.0",   null: false
    t.string   "state"
    t.decimal  "adjustment_total",                  precision: 10, scale: 2, default: "0.0",   null: false
    t.integer  "user_id"
    t.datetime "completed_at"
    t.integer  "bill_address_id"
    t.integer  "ship_address_id"
    t.decimal  "payment_total",                     precision: 10, scale: 2, default: "0.0"
    t.string   "shipment_state"
    t.string   "payment_state"
    t.string   "email"
    t.text     "special_instructions"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "currency"
    t.string   "last_ip_address"
    t.integer  "created_by_id"
    t.decimal  "shipment_total",                    precision: 10, scale: 2, default: "0.0",   null: false
    t.decimal  "additional_tax_total",              precision: 10, scale: 2, default: "0.0"
    t.decimal  "promo_total",                       precision: 10, scale: 2, default: "0.0"
    t.string   "channel",                                                    default: "spree"
    t.decimal  "included_tax_total",                precision: 10, scale: 2, default: "0.0",   null: false
    t.integer  "item_count",                                                 default: 0
    t.integer  "approver_id"
    t.datetime "approved_at"
    t.boolean  "confirmation_delivered",                                     default: false
    t.string   "guest_token"
    t.datetime "canceled_at"
    t.integer  "canceler_id"
    t.integer  "store_id"
    t.string   "approver_name"
    t.boolean  "frontend_viewable",                                          default: true,    null: false
    t.text     "braintree_device_data"
    t.integer  "invoice_number"
    t.date     "invoice_date"
    t.integer  "shipwire_id"
    t.boolean  "subscription_order",                                         default: false,   null: false
    t.boolean  "is_pos",                                                     default: false
    t.index ["approver_id"], name: "index_spree_orders_on_approver_id", using: :btree
    t.index ["bill_address_id"], name: "index_spree_orders_on_bill_address_id", using: :btree
    t.index ["completed_at"], name: "index_spree_orders_on_completed_at", using: :btree
    t.index ["created_by_id"], name: "index_spree_orders_on_created_by_id", using: :btree
    t.index ["guest_token"], name: "index_spree_orders_on_guest_token", using: :btree
    t.index ["is_pos"], name: "index_spree_orders_on_is_pos", using: :btree
    t.index ["number"], name: "index_spree_orders_on_number", using: :btree
    t.index ["ship_address_id"], name: "index_spree_orders_on_ship_address_id", using: :btree
    t.index ["user_id", "created_by_id"], name: "index_spree_orders_on_user_id_and_created_by_id", using: :btree
    t.index ["user_id"], name: "index_spree_orders_on_user_id", using: :btree
  end

  create_table "spree_orders_promotions", force: :cascade do |t|
    t.integer  "order_id"
    t.integer  "promotion_id"
    t.integer  "promotion_code_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["order_id", "promotion_id"], name: "index_spree_orders_promotions_on_order_id_and_promotion_id", using: :btree
    t.index ["promotion_code_id"], name: "index_spree_orders_promotions_on_promotion_code_id", using: :btree
  end

  create_table "spree_page_events", force: :cascade do |t|
    t.string   "actor_type"
    t.integer  "actor_id"
    t.string   "target_type"
    t.integer  "target_id"
    t.string   "activity"
    t.string   "referrer"
    t.string   "search_keywords"
    t.string   "session_id"
    t.string   "query_string"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["actor_type", "actor_id"], name: "index_spree_page_events_on_actor_type_and_actor_id", using: :btree
    t.index ["target_type", "target_id"], name: "index_spree_page_events_on_target_type_and_target_id", using: :btree
  end

  create_table "spree_pages", force: :cascade do |t|
    t.string   "title"
    t.text     "body"
    t.string   "slug"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "show_in_header",           default: false, null: false
    t.boolean  "show_in_footer",           default: false, null: false
    t.string   "foreign_link"
    t.integer  "position",                 default: 1,     null: false
    t.boolean  "visible",                  default: true
    t.string   "meta_keywords"
    t.string   "meta_description"
    t.string   "layout"
    t.boolean  "show_in_sidebar",          default: false, null: false
    t.string   "meta_title"
    t.boolean  "render_layout_as_partial", default: false
    t.index ["slug"], name: "index_spree_pages_on_slug", using: :btree
  end

  create_table "spree_pages_stores", id: false, force: :cascade do |t|
    t.integer  "store_id"
    t.integer  "page_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["page_id"], name: "index_spree_pages_stores_on_page_id", using: :btree
    t.index ["store_id"], name: "index_spree_pages_stores_on_store_id", using: :btree
  end

  create_table "spree_payment_capture_events", force: :cascade do |t|
    t.decimal  "amount",     precision: 10, scale: 2, default: "0.0"
    t.integer  "payment_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["payment_id"], name: "index_spree_payment_capture_events_on_payment_id", using: :btree
  end

  create_table "spree_payment_methods", force: :cascade do |t|
    t.string   "type"
    t.string   "name"
    t.text     "description"
    t.boolean  "active",             default: true
    t.datetime "deleted_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "auto_capture"
    t.text     "preferences"
    t.string   "preference_source"
    t.integer  "position",           default: 0
    t.boolean  "available_to_users", default: true
    t.boolean  "available_to_admin", default: true
    t.index ["id", "type"], name: "index_spree_payment_methods_on_id_and_type", using: :btree
  end

  create_table "spree_payment_versions", force: :cascade do |t|
    t.string   "item_type",      null: false
    t.integer  "item_id",        null: false
    t.string   "event",          null: false
    t.string   "whodunnit"
    t.text     "object"
    t.text     "object_changes"
    t.datetime "created_at"
    t.index ["item_type", "item_id"], name: "index_spree_payment_versions_on_item_type_and_item_id", using: :btree
  end

  create_table "spree_payments", force: :cascade do |t|
    t.decimal  "amount",               precision: 10, scale: 2, default: "0.0", null: false
    t.integer  "order_id"
    t.string   "source_type"
    t.integer  "source_id"
    t.integer  "payment_method_id"
    t.string   "state"
    t.string   "response_code"
    t.string   "avs_response"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "number"
    t.string   "cvv_response_code"
    t.string   "cvv_response_message"
    t.string   "card_name"
    t.integer  "payable_id"
    t.string   "payable_type"
    t.index ["number"], name: "index_spree_payments_on_number", unique: true, using: :btree
    t.index ["order_id"], name: "index_spree_payments_on_order_id", using: :btree
    t.index ["payable_id", "payable_type"], name: "index_spree_payments_on_payable_id_and_payable_type", using: :btree
    t.index ["payment_method_id"], name: "index_spree_payments_on_payment_method_id", using: :btree
    t.index ["source_id", "source_type"], name: "index_spree_payments_on_source_id_and_source_type", using: :btree
  end

  create_table "spree_permission_sets", force: :cascade do |t|
    t.string   "name"
    t.string   "set"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "spree_plans", force: :cascade do |t|
    t.string   "api_plan_id"
    t.decimal  "amount",            precision: 8, scale: 2
    t.string   "interval"
    t.integer  "interval_count",                            default: 1
    t.string   "name"
    t.string   "currency"
    t.integer  "recurring_id"
    t.integer  "trial_period_days",                         default: 0
    t.boolean  "active",                                    default: false
    t.datetime "deleted_at"
    t.boolean  "default",                                   default: false
    t.boolean  "free_shipping"
    t.boolean  "free_cleaning"
    t.string   "description"
    t.integer  "points"
    t.boolean  "special_sales"
    t.index ["default"], name: "index_spree_plans_on_default", using: :btree
    t.index ["deleted_at", "active"], name: "index_spree_plans_on_deleted_at_and_active", using: :btree
    t.index ["deleted_at", "recurring_id", "active"], name: "index_spree_plans_on_deleted_at_and_recurring_id_and_active", using: :btree
    t.index ["deleted_at", "recurring_id"], name: "index_spree_plans_on_deleted_at_and_recurring_id", using: :btree
    t.index ["deleted_at"], name: "index_spree_plans_on_deleted_at", using: :btree
  end

  create_table "spree_preferences", force: :cascade do |t|
    t.text     "value"
    t.string   "key"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["key"], name: "index_spree_preferences_on_key", unique: true, using: :btree
  end

  create_table "spree_prices", force: :cascade do |t|
    t.integer  "variant_id",                                     null: false
    t.decimal  "amount",                precision: 10, scale: 2
    t.string   "currency"
    t.datetime "deleted_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "country_iso", limit: 2
    t.index ["country_iso"], name: "index_spree_prices_on_country_iso", using: :btree
    t.index ["variant_id", "currency"], name: "index_spree_prices_on_variant_id_and_currency", using: :btree
  end

  create_table "spree_product_imports", force: :cascade do |t|
    t.string   "data_file_file_name"
    t.string   "data_file_content_type"
    t.integer  "data_file_file_size"
    t.datetime "data_file_updated_at"
    t.string   "state"
    t.text     "product_ids"
    t.datetime "completed_at"
    t.datetime "failed_at"
    t.text     "error_message"
    t.integer  "created_by"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "separatorChar"
    t.string   "encoding_csv"
    t.string   "quoteChar"
  end

  create_table "spree_product_option_types", force: :cascade do |t|
    t.integer  "position"
    t.integer  "product_id"
    t.integer  "option_type_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["option_type_id"], name: "index_spree_product_option_types_on_option_type_id", using: :btree
    t.index ["position"], name: "index_spree_product_option_types_on_position", using: :btree
    t.index ["product_id"], name: "index_spree_product_option_types_on_product_id", using: :btree
  end

  create_table "spree_product_packages", force: :cascade do |t|
    t.integer  "product_id",             null: false
    t.integer  "length",     default: 0, null: false
    t.integer  "width",      default: 0, null: false
    t.integer  "height",     default: 0, null: false
    t.integer  "weight",     default: 0, null: false
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "spree_product_promotion_rules", force: :cascade do |t|
    t.integer  "product_id"
    t.integer  "promotion_rule_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["product_id"], name: "index_products_promotion_rules_on_product_id", using: :btree
    t.index ["promotion_rule_id"], name: "index_products_promotion_rules_on_promotion_rule_id", using: :btree
  end

  create_table "spree_product_properties", force: :cascade do |t|
    t.string   "value"
    t.integer  "product_id"
    t.integer  "property_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "position",    default: 0
    t.index ["position"], name: "index_spree_product_properties_on_position", using: :btree
    t.index ["product_id"], name: "index_product_properties_on_product_id", using: :btree
    t.index ["property_id"], name: "index_spree_product_properties_on_property_id", using: :btree
  end

  create_table "spree_product_recommendations", force: :cascade do |t|
    t.integer  "product_id"
    t.string   "recommendation_source"
    t.string   "comment_title"
    t.text     "comment"
    t.string   "scoring_type"
    t.string   "scoring_value"
    t.boolean  "hide",                  default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "spree_products", force: :cascade do |t|
    t.string   "name",                                         default: "",    null: false
    t.text     "description"
    t.datetime "available_on"
    t.datetime "deleted_at"
    t.string   "slug"
    t.text     "meta_description"
    t.string   "meta_keywords"
    t.integer  "tax_category_id"
    t.integer  "shipping_category_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "promotionable",                                default: true
    t.string   "meta_title"
    t.boolean  "can_be_part",                                  default: false, null: false
    t.boolean  "individual_sale",                              default: true,  null: false
    t.decimal  "avg_rating",           precision: 7, scale: 5, default: "0.0", null: false
    t.integer  "reviews_count",                                default: 0,     null: false
    t.boolean  "dynamic_variants",                             default: false
    t.string   "labeling"
    t.boolean  "special",                                      default: false
    t.index ["available_on"], name: "index_spree_products_on_available_on", using: :btree
    t.index ["deleted_at"], name: "index_spree_products_on_deleted_at", using: :btree
    t.index ["name"], name: "index_spree_products_on_name", using: :btree
    t.index ["slug"], name: "index_spree_products_on_slug", unique: true, using: :btree
  end

  create_table "spree_products_stores", id: false, force: :cascade do |t|
    t.integer "product_id"
    t.integer "store_id"
    t.index ["product_id"], name: "index_spree_products_stores_on_product_id", using: :btree
    t.index ["store_id"], name: "index_spree_products_stores_on_store_id", using: :btree
  end

  create_table "spree_products_taxons", force: :cascade do |t|
    t.integer  "product_id"
    t.integer  "taxon_id"
    t.integer  "position"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["position"], name: "index_spree_products_taxons_on_position", using: :btree
    t.index ["product_id"], name: "index_spree_products_taxons_on_product_id", using: :btree
    t.index ["taxon_id"], name: "index_spree_products_taxons_on_taxon_id", using: :btree
  end

  create_table "spree_promotion_action_line_items", force: :cascade do |t|
    t.integer  "promotion_action_id"
    t.integer  "variant_id"
    t.integer  "quantity",            default: 1
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["promotion_action_id"], name: "index_spree_promotion_action_line_items_on_promotion_action_id", using: :btree
    t.index ["variant_id"], name: "index_spree_promotion_action_line_items_on_variant_id", using: :btree
  end

  create_table "spree_promotion_actions", force: :cascade do |t|
    t.integer  "promotion_id"
    t.integer  "position"
    t.string   "type"
    t.datetime "deleted_at"
    t.text     "preferences"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["deleted_at"], name: "index_spree_promotion_actions_on_deleted_at", using: :btree
    t.index ["id", "type"], name: "index_spree_promotion_actions_on_id_and_type", using: :btree
    t.index ["promotion_id"], name: "index_spree_promotion_actions_on_promotion_id", using: :btree
  end

  create_table "spree_promotion_categories", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "code"
  end

  create_table "spree_promotion_code_batches", force: :cascade do |t|
    t.integer  "promotion_id",                        null: false
    t.string   "base_code",                           null: false
    t.integer  "number_of_codes",                     null: false
    t.string   "email"
    t.string   "error"
    t.string   "state",           default: "pending"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.index ["promotion_id"], name: "index_spree_promotion_code_batches_on_promotion_id", using: :btree
  end

  create_table "spree_promotion_codes", force: :cascade do |t|
    t.integer  "promotion_id",            null: false
    t.string   "value",                   null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "promotion_code_batch_id"
    t.index ["promotion_code_batch_id"], name: "index_spree_promotion_codes_on_promotion_code_batch_id", using: :btree
    t.index ["promotion_id"], name: "index_spree_promotion_codes_on_promotion_id", using: :btree
    t.index ["value"], name: "index_spree_promotion_codes_on_value", unique: true, using: :btree
  end

  create_table "spree_promotion_rule_taxons", force: :cascade do |t|
    t.integer  "taxon_id"
    t.integer  "promotion_rule_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["promotion_rule_id"], name: "index_spree_promotion_rule_taxons_on_promotion_rule_id", using: :btree
    t.index ["taxon_id"], name: "index_spree_promotion_rule_taxons_on_taxon_id", using: :btree
  end

  create_table "spree_promotion_rules", force: :cascade do |t|
    t.integer  "promotion_id"
    t.integer  "product_group_id"
    t.string   "type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "code"
    t.text     "preferences"
    t.index ["product_group_id"], name: "index_promotion_rules_on_product_group_id", using: :btree
    t.index ["promotion_id"], name: "index_spree_promotion_rules_on_promotion_id", using: :btree
  end

  create_table "spree_promotion_rules_stores", id: false, force: :cascade do |t|
    t.integer "promotion_rule_id"
    t.integer "store_id"
    t.index ["promotion_rule_id"], name: "index_spree_promotion_rules_stores_on_promotion_rule_id", using: :btree
    t.index ["store_id"], name: "index_spree_promotion_rules_stores_on_store_id", using: :btree
  end

  create_table "spree_promotion_rules_users", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "promotion_rule_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["promotion_rule_id"], name: "index_promotion_rules_users_on_promotion_rule_id", using: :btree
    t.index ["user_id"], name: "index_promotion_rules_users_on_user_id", using: :btree
  end

  create_table "spree_promotions", force: :cascade do |t|
    t.string   "description"
    t.datetime "expires_at"
    t.datetime "starts_at"
    t.string   "name"
    t.string   "type"
    t.integer  "usage_limit"
    t.string   "match_policy",          default: "all"
    t.string   "code"
    t.boolean  "advertise",             default: false
    t.string   "path"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "promotion_category_id"
    t.integer  "per_code_usage_limit"
    t.boolean  "apply_automatically",   default: false
    t.index ["advertise"], name: "index_spree_promotions_on_advertise", using: :btree
    t.index ["apply_automatically"], name: "index_spree_promotions_on_apply_automatically", using: :btree
    t.index ["code"], name: "index_spree_promotions_on_code", using: :btree
    t.index ["expires_at"], name: "index_spree_promotions_on_expires_at", using: :btree
    t.index ["id", "type"], name: "index_spree_promotions_on_id_and_type", using: :btree
    t.index ["promotion_category_id"], name: "index_spree_promotions_on_promotion_category_id", using: :btree
    t.index ["starts_at"], name: "index_spree_promotions_on_starts_at", using: :btree
  end

  create_table "spree_properties", force: :cascade do |t|
    t.string   "name"
    t.string   "presentation", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "filterable"
  end

  create_table "spree_property_prototypes", force: :cascade do |t|
    t.integer  "prototype_id"
    t.integer  "property_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "spree_prototype_taxons", force: :cascade do |t|
    t.integer  "taxon_id"
    t.integer  "prototype_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["prototype_id"], name: "index_spree_prototype_taxons_on_prototype_id", using: :btree
    t.index ["taxon_id"], name: "index_spree_prototype_taxons_on_taxon_id", using: :btree
  end

  create_table "spree_prototypes", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "spree_recurrings", force: :cascade do |t|
    t.string   "name"
    t.string   "type"
    t.text     "description"
    t.boolean  "active"
    t.datetime "deleted_at"
    t.text     "preferences"
    t.index ["deleted_at"], name: "index_spree_recurrings_on_deleted_at", using: :btree
  end

  create_table "spree_refund_reasons", force: :cascade do |t|
    t.string   "name"
    t.boolean  "active",     default: true
    t.boolean  "mutable",    default: true
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "code"
  end

  create_table "spree_refunds", force: :cascade do |t|
    t.integer  "payment_id"
    t.decimal  "amount",           precision: 10, scale: 2, default: "0.0", null: false
    t.string   "transaction_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "refund_reason_id"
    t.integer  "reimbursement_id"
    t.index ["payment_id"], name: "index_spree_refunds_on_payment_id", using: :btree
    t.index ["refund_reason_id"], name: "index_refunds_on_refund_reason_id", using: :btree
    t.index ["reimbursement_id"], name: "index_spree_refunds_on_reimbursement_id", using: :btree
  end

  create_table "spree_reimbursement_credits", force: :cascade do |t|
    t.decimal  "amount",           precision: 10, scale: 2, default: "0.0", null: false
    t.integer  "reimbursement_id"
    t.integer  "creditable_id"
    t.string   "creditable_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "spree_reimbursement_types", force: :cascade do |t|
    t.string   "name"
    t.boolean  "active",     default: true
    t.boolean  "mutable",    default: true
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "type"
    t.index ["type"], name: "index_spree_reimbursement_types_on_type", using: :btree
  end

  create_table "spree_reimbursements", force: :cascade do |t|
    t.string   "number"
    t.string   "reimbursement_status"
    t.integer  "customer_return_id"
    t.integer  "order_id"
    t.decimal  "total",                precision: 10, scale: 2
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["customer_return_id"], name: "index_spree_reimbursements_on_customer_return_id", using: :btree
    t.index ["order_id"], name: "index_spree_reimbursements_on_order_id", using: :btree
  end

  create_table "spree_relation_types", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.string   "applies_to"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "spree_relations", force: :cascade do |t|
    t.integer  "relation_type_id"
    t.string   "relatable_type"
    t.integer  "relatable_id"
    t.string   "related_to_type"
    t.integer  "related_to_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.decimal  "discount_amount",  precision: 8, scale: 2, default: "0.0"
    t.integer  "position"
  end

  create_table "spree_return_authorization_versions", force: :cascade do |t|
    t.string   "item_type",      null: false
    t.integer  "item_id",        null: false
    t.string   "event",          null: false
    t.string   "whodunnit"
    t.text     "object"
    t.text     "object_changes"
    t.datetime "created_at"
    t.index ["item_type", "item_id"], name: "spree_return_auth_versions", using: :btree
  end

  create_table "spree_return_authorizations", force: :cascade do |t|
    t.string   "number"
    t.string   "state"
    t.integer  "order_id"
    t.text     "memo"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "stock_location_id"
    t.integer  "return_reason_id"
    t.index ["return_reason_id"], name: "index_return_authorizations_on_return_authorization_reason_id", using: :btree
  end

  create_table "spree_return_items", force: :cascade do |t|
    t.integer  "return_authorization_id"
    t.integer  "inventory_unit_id"
    t.integer  "exchange_variant_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.decimal  "amount",                          precision: 12, scale: 4, default: "0.0", null: false
    t.decimal  "included_tax_total",              precision: 12, scale: 4, default: "0.0", null: false
    t.decimal  "additional_tax_total",            precision: 12, scale: 4, default: "0.0", null: false
    t.string   "reception_status"
    t.string   "acceptance_status"
    t.integer  "customer_return_id"
    t.integer  "reimbursement_id"
    t.integer  "exchange_inventory_unit_id"
    t.text     "acceptance_status_errors"
    t.integer  "preferred_reimbursement_type_id"
    t.integer  "override_reimbursement_type_id"
    t.boolean  "resellable",                                               default: true,  null: false
    t.integer  "return_reason_id"
    t.index ["customer_return_id"], name: "index_return_items_on_customer_return_id", using: :btree
    t.index ["exchange_inventory_unit_id"], name: "index_spree_return_items_on_exchange_inventory_unit_id", using: :btree
  end

  create_table "spree_return_reasons", force: :cascade do |t|
    t.string   "name"
    t.boolean  "active",     default: true
    t.boolean  "mutable",    default: true
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "spree_reviews", force: :cascade do |t|
    t.integer  "product_id"
    t.string   "name"
    t.string   "location"
    t.integer  "rating"
    t.text     "title"
    t.text     "review"
    t.boolean  "approved",        default: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.string   "ip_address"
    t.string   "locale",          default: "en"
    t.boolean  "show_identifier", default: true
    t.index ["show_identifier"], name: "index_spree_reviews_on_show_identifier", using: :btree
  end

  create_table "spree_role_permissions", force: :cascade do |t|
    t.integer  "role_id"
    t.integer  "permission_set_id"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  create_table "spree_roles", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "spree_roles_users", force: :cascade do |t|
    t.integer  "role_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["role_id"], name: "index_spree_roles_users_on_role_id", using: :btree
    t.index ["user_id"], name: "index_spree_roles_users_on_user_id", using: :btree
  end

  create_table "spree_sale_prices", force: :cascade do |t|
    t.integer  "price_id"
    t.float    "value"
    t.datetime "start_at"
    t.datetime "end_at"
    t.boolean  "enabled"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["price_id", "start_at", "end_at", "enabled"], name: "index_active_sale_prices_for_price", using: :btree
    t.index ["price_id"], name: "index_sale_prices_for_price", using: :btree
    t.index ["start_at", "end_at", "enabled"], name: "index_active_sale_prices_for_all_variants", using: :btree
  end

  create_table "spree_shipment_versions", force: :cascade do |t|
    t.string   "item_type",      null: false
    t.integer  "item_id",        null: false
    t.string   "event",          null: false
    t.string   "whodunnit"
    t.text     "object"
    t.text     "object_changes"
    t.datetime "created_at"
    t.index ["item_type", "item_id"], name: "index_spree_shipment_versions_on_item_type_and_item_id", using: :btree
  end

  create_table "spree_shipments", force: :cascade do |t|
    t.string   "tracking"
    t.string   "number"
    t.decimal  "cost",                  precision: 10, scale: 2, default: "0.0"
    t.datetime "shipped_at"
    t.integer  "order_id"
    t.integer  "deprecated_address_id"
    t.string   "state"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "stock_location_id"
    t.decimal  "adjustment_total",      precision: 10, scale: 2, default: "0.0"
    t.decimal  "additional_tax_total",  precision: 10, scale: 2, default: "0.0"
    t.decimal  "promo_total",           precision: 10, scale: 2, default: "0.0"
    t.decimal  "included_tax_total",    precision: 10, scale: 2, default: "0.0", null: false
    t.datetime "delivered_at"
    t.datetime "canceled_at"
    t.decimal  "supplier_commission",   precision: 8,  scale: 2, default: "0.0", null: false
    t.index ["deprecated_address_id"], name: "index_spree_shipments_on_deprecated_address_id", using: :btree
    t.index ["number"], name: "index_shipments_on_number", using: :btree
    t.index ["order_id"], name: "index_spree_shipments_on_order_id", using: :btree
    t.index ["stock_location_id"], name: "index_spree_shipments_on_stock_location_id", using: :btree
  end

  create_table "spree_shipping_categories", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "spree_shipping_method_categories", force: :cascade do |t|
    t.integer  "shipping_method_id",   null: false
    t.integer  "shipping_category_id", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["shipping_category_id", "shipping_method_id"], name: "unique_spree_shipping_method_categories", unique: true, using: :btree
    t.index ["shipping_method_id"], name: "index_spree_shipping_method_categories_on_shipping_method_id", using: :btree
  end

  create_table "spree_shipping_method_stock_locations", force: :cascade do |t|
    t.integer  "shipping_method_id"
    t.integer  "stock_location_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["shipping_method_id"], name: "shipping_method_id_spree_sm_sl", using: :btree
    t.index ["stock_location_id"], name: "sstock_location_id_spree_sm_sl", using: :btree
  end

  create_table "spree_shipping_method_zones", force: :cascade do |t|
    t.integer  "shipping_method_id"
    t.integer  "zone_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "spree_shipping_methods", force: :cascade do |t|
    t.string   "name"
    t.datetime "deleted_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "tracking_url"
    t.string   "admin_name"
    t.integer  "tax_category_id"
    t.string   "code"
    t.boolean  "available_to_all",   default: true
    t.string   "carrier"
    t.string   "service_level"
    t.boolean  "available_to_users", default: true
    t.index ["tax_category_id"], name: "index_spree_shipping_methods_on_tax_category_id", using: :btree
  end

  create_table "spree_shipping_rate_taxes", force: :cascade do |t|
    t.decimal  "amount",           precision: 8, scale: 2, default: "0.0", null: false
    t.integer  "tax_rate_id"
    t.integer  "shipping_rate_id"
    t.datetime "created_at",                                               null: false
    t.datetime "updated_at",                                               null: false
    t.index ["shipping_rate_id"], name: "index_spree_shipping_rate_taxes_on_shipping_rate_id", using: :btree
    t.index ["tax_rate_id"], name: "index_spree_shipping_rate_taxes_on_tax_rate_id", using: :btree
  end

  create_table "spree_shipping_rates", force: :cascade do |t|
    t.integer  "shipment_id"
    t.integer  "shipping_method_id"
    t.boolean  "selected",                                   default: false
    t.decimal  "cost",               precision: 8, scale: 2, default: "0.0"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "tax_rate_id"
    t.index ["shipment_id", "shipping_method_id"], name: "spree_shipping_rates_join_index", unique: true, using: :btree
  end

  create_table "spree_signifyd_order_scores", force: :cascade do |t|
    t.integer  "order_id"
    t.integer  "score"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["order_id"], name: "index_spree_signifyd_order_scores_on_order_id", unique: true, using: :btree
  end

  create_table "spree_skrill_transactions", force: :cascade do |t|
    t.string   "email"
    t.float    "amount"
    t.string   "currency"
    t.integer  "transaction_id"
    t.integer  "customer_id"
    t.string   "payment_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "spree_state_changes", force: :cascade do |t|
    t.string   "name"
    t.string   "previous_state"
    t.integer  "stateful_id"
    t.integer  "user_id"
    t.string   "stateful_type"
    t.string   "next_state"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["stateful_id", "stateful_type"], name: "index_spree_state_changes_on_stateful_id_and_stateful_type", using: :btree
    t.index ["user_id"], name: "index_spree_state_changes_on_user_id", using: :btree
  end

  create_table "spree_states", force: :cascade do |t|
    t.string   "name"
    t.string   "abbr"
    t.integer  "country_id"
    t.datetime "updated_at"
    t.datetime "created_at"
    t.index ["country_id"], name: "index_spree_states_on_country_id", using: :btree
  end

  create_table "spree_stock_items", force: :cascade do |t|
    t.integer  "stock_location_id"
    t.integer  "variant_id"
    t.integer  "count_on_hand",     default: 0,     null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "backorderable",     default: false
    t.datetime "deleted_at"
    t.index ["deleted_at"], name: "index_spree_stock_items_on_deleted_at", using: :btree
    t.index ["stock_location_id", "variant_id"], name: "stock_item_by_loc_and_var_id", using: :btree
    t.index ["stock_location_id"], name: "index_spree_stock_items_on_stock_location_id", using: :btree
    t.index ["variant_id", "stock_location_id"], name: "index_spree_stock_items_on_variant_id_and_stock_location_id", unique: true, where: "(deleted_at IS NULL)", using: :btree
  end

  create_table "spree_stock_locations", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "default",                 default: false, null: false
    t.string   "address1"
    t.string   "address2"
    t.string   "city"
    t.integer  "state_id"
    t.string   "state_name"
    t.integer  "country_id"
    t.string   "zipcode"
    t.string   "phone"
    t.boolean  "active",                  default: true
    t.boolean  "backorderable_default",   default: false
    t.boolean  "propagate_all_variants",  default: true
    t.string   "admin_name"
    t.integer  "position",                default: 0
    t.boolean  "restock_inventory",       default: true,  null: false
    t.boolean  "fulfillable",             default: true,  null: false
    t.string   "code"
    t.boolean  "check_stock_on_transfer", default: true
    t.string   "shipwire_id"
    t.boolean  "store",                   default: false
    t.integer  "address_id"
    t.integer  "supplier_id"
    t.index ["address_id"], name: "index_spree_stock_locations_on_address_id", using: :btree
    t.index ["country_id"], name: "index_spree_stock_locations_on_country_id", using: :btree
    t.index ["state_id"], name: "index_spree_stock_locations_on_state_id", using: :btree
    t.index ["store"], name: "index_spree_stock_locations_on_store", using: :btree
    t.index ["supplier_id"], name: "index_spree_stock_locations_on_supplier_id", using: :btree
  end

  create_table "spree_stock_movements", force: :cascade do |t|
    t.integer  "stock_item_id"
    t.integer  "quantity",        default: 0
    t.string   "action"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.string   "originator_type"
    t.integer  "originator_id"
    t.index ["stock_item_id"], name: "index_spree_stock_movements_on_stock_item_id", using: :btree
  end

  create_table "spree_stock_requests", force: :cascade do |t|
    t.string   "email"
    t.integer  "variant_id"
    t.string   "status",     default: "new"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["variant_id"], name: "index_spree_stock_requests_on_variant_id", using: :btree
  end

  create_table "spree_stock_transfers", force: :cascade do |t|
    t.string   "description"
    t.integer  "source_location_id"
    t.integer  "destination_location_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "number"
    t.datetime "shipped_at"
    t.datetime "closed_at"
    t.string   "tracking_number"
    t.integer  "created_by_id"
    t.integer  "closed_by_id"
    t.datetime "finalized_at"
    t.integer  "finalized_by_id"
    t.datetime "deleted_at"
    t.index ["closed_at"], name: "index_spree_stock_transfers_on_closed_at", using: :btree
    t.index ["destination_location_id"], name: "index_spree_stock_transfers_on_destination_location_id", using: :btree
    t.index ["finalized_at"], name: "index_spree_stock_transfers_on_finalized_at", using: :btree
    t.index ["number"], name: "index_spree_stock_transfers_on_number", using: :btree
    t.index ["shipped_at"], name: "index_spree_stock_transfers_on_shipped_at", using: :btree
    t.index ["source_location_id"], name: "index_spree_stock_transfers_on_source_location_id", using: :btree
  end

  create_table "spree_store_credit_categories", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "spree_store_credit_events", force: :cascade do |t|
    t.integer  "store_credit_id",                                            null: false
    t.string   "action",                                                     null: false
    t.decimal  "amount",             precision: 8, scale: 2
    t.decimal  "user_total_amount",  precision: 8, scale: 2, default: "0.0", null: false
    t.string   "authorization_code",                                         null: false
    t.datetime "deleted_at"
    t.string   "originator_type"
    t.integer  "originator_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "update_reason_id"
    t.index ["deleted_at"], name: "index_spree_store_credit_events_on_deleted_at", using: :btree
    t.index ["store_credit_id"], name: "index_spree_store_credit_events_on_store_credit_id", using: :btree
  end

  create_table "spree_store_credit_types", force: :cascade do |t|
    t.string   "name"
    t.integer  "priority"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["priority"], name: "index_spree_store_credit_types_on_priority", using: :btree
  end

  create_table "spree_store_credit_update_reasons", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "spree_store_credits", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "category_id"
    t.integer  "created_by_id"
    t.decimal  "amount",            precision: 8, scale: 2, default: "0.0", null: false
    t.decimal  "amount_used",       precision: 8, scale: 2, default: "0.0", null: false
    t.decimal  "amount_authorized", precision: 8, scale: 2, default: "0.0", null: false
    t.string   "currency"
    t.text     "memo"
    t.datetime "deleted_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "type_id"
    t.datetime "invalidated_at"
    t.index ["deleted_at"], name: "index_spree_store_credits_on_deleted_at", using: :btree
    t.index ["type_id"], name: "index_spree_store_credits_on_type_id", using: :btree
    t.index ["user_id"], name: "index_spree_store_credits_on_user_id", using: :btree
  end

  create_table "spree_store_payment_methods", force: :cascade do |t|
    t.integer  "store_id",          null: false
    t.integer  "payment_method_id", null: false
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.index ["payment_method_id"], name: "index_spree_store_payment_methods_on_payment_method_id", using: :btree
    t.index ["store_id"], name: "index_spree_store_payment_methods_on_store_id", using: :btree
  end

  create_table "spree_store_shipping_methods", force: :cascade do |t|
    t.integer  "store_id"
    t.integer  "shipping_method_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["shipping_method_id"], name: "index_spree_store_shipping_methods_on_shipping_method_id", using: :btree
    t.index ["store_id"], name: "index_spree_store_shipping_methods_on_store_id", using: :btree
  end

  create_table "spree_stores", force: :cascade do |t|
    t.string   "name"
    t.string   "url"
    t.text     "meta_description"
    t.text     "meta_keywords"
    t.string   "seo_title"
    t.string   "mail_from_address"
    t.string   "default_currency"
    t.string   "code"
    t.boolean  "default",              default: false, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "cart_tax_country_iso"
    t.string   "logo_file_name"
    t.index ["code"], name: "index_spree_stores_on_code", using: :btree
    t.index ["default"], name: "index_spree_stores_on_default", using: :btree
  end

  create_table "spree_subscription_events", force: :cascade do |t|
    t.string   "event_id"
    t.integer  "subscription_id"
    t.string   "request_type"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.text     "response"
    t.index ["event_id"], name: "index_spree_subscription_events_on_event_id", using: :btree
    t.index ["subscription_id"], name: "index_spree_subscription_events_on_subscription_id", using: :btree
  end

  create_table "spree_subscriptions", force: :cascade do |t|
    t.integer  "plan_id"
    t.string   "email"
    t.integer  "user_id"
    t.datetime "subscribed_at"
    t.datetime "unsubscribed_at"
    t.index ["plan_id"], name: "index_spree_subscriptions_on_plan_id", using: :btree
    t.index ["subscribed_at"], name: "index_spree_subscriptions_on_subscribed_at", using: :btree
    t.index ["unsubscribed_at"], name: "index_spree_subscriptions_on_unsubscribed_at", using: :btree
  end

  create_table "spree_supplier_bank_accounts", force: :cascade do |t|
    t.string   "masked_number"
    t.integer  "supplier_id"
    t.string   "token"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "country_iso"
    t.string   "name"
    t.index ["supplier_id"], name: "index_spree_supplier_bank_accounts_on_supplier_id", using: :btree
    t.index ["token"], name: "index_spree_supplier_bank_accounts_on_token", using: :btree
  end

  create_table "spree_supplier_variants", force: :cascade do |t|
    t.integer  "supplier_id"
    t.integer  "variant_id"
    t.decimal  "cost"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["supplier_id"], name: "index_spree_supplier_variants_on_supplier_id", using: :btree
    t.index ["variant_id"], name: "index_spree_supplier_variants_on_variant_id", using: :btree
  end

  create_table "spree_suppliers", force: :cascade do |t|
    t.boolean  "active",                                        default: false, null: false
    t.integer  "address_id"
    t.decimal  "commission_flat_rate",  precision: 8, scale: 2, default: "0.0", null: false
    t.float    "commission_percentage",                         default: 0.0,   null: false
    t.string   "email"
    t.string   "name"
    t.string   "url"
    t.datetime "deleted_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "tax_id"
    t.string   "token"
    t.string   "slug"
    t.index ["active"], name: "index_spree_suppliers_on_active", using: :btree
    t.index ["address_id"], name: "index_spree_suppliers_on_address_id", using: :btree
    t.index ["deleted_at"], name: "index_spree_suppliers_on_deleted_at", using: :btree
    t.index ["slug"], name: "index_spree_suppliers_on_slug", unique: true, using: :btree
    t.index ["token"], name: "index_spree_suppliers_on_token", using: :btree
  end

  create_table "spree_tax_categories", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.boolean  "is_default",  default: false
    t.datetime "deleted_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "tax_code"
  end

  create_table "spree_tax_rates", force: :cascade do |t|
    t.decimal  "amount",             precision: 8, scale: 5
    t.integer  "zone_id"
    t.integer  "tax_category_id"
    t.boolean  "included_in_price",                          default: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
    t.boolean  "show_rate_in_label",                         default: true
    t.datetime "deleted_at"
    t.index ["deleted_at"], name: "index_spree_tax_rates_on_deleted_at", using: :btree
    t.index ["tax_category_id"], name: "index_spree_tax_rates_on_tax_category_id", using: :btree
    t.index ["zone_id"], name: "index_spree_tax_rates_on_zone_id", using: :btree
  end

  create_table "spree_taxonomies", force: :cascade do |t|
    t.string   "name",                   null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "position",   default: 0
    t.integer  "store_id"
    t.boolean  "filterable"
    t.index ["position"], name: "index_spree_taxonomies_on_position", using: :btree
    t.index ["store_id"], name: "index_spree_taxonomies_on_store_id", using: :btree
  end

  create_table "spree_taxons", force: :cascade do |t|
    t.integer  "parent_id"
    t.integer  "position",          default: 0
    t.string   "name",                          null: false
    t.string   "permalink"
    t.integer  "taxonomy_id"
    t.integer  "lft"
    t.integer  "rgt"
    t.string   "icon_file_name"
    t.string   "icon_content_type"
    t.integer  "icon_file_size"
    t.datetime "icon_updated_at"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "meta_title"
    t.string   "meta_description"
    t.string   "meta_keywords"
    t.integer  "depth"
    t.index ["parent_id"], name: "index_taxons_on_parent_id", using: :btree
    t.index ["permalink"], name: "index_taxons_on_permalink", using: :btree
    t.index ["position"], name: "index_spree_taxons_on_position", using: :btree
    t.index ["taxonomy_id"], name: "index_taxons_on_taxonomy_id", using: :btree
  end

  create_table "spree_trackers", force: :cascade do |t|
    t.string   "environment"
    t.string   "analytics_id"
    t.boolean  "active",       default: true
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.integer  "store_id"
  end

  create_table "spree_transfer_items", force: :cascade do |t|
    t.integer  "variant_id",                    null: false
    t.integer  "stock_transfer_id",             null: false
    t.integer  "expected_quantity", default: 0, null: false
    t.integer  "received_quantity", default: 0, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "deleted_at"
    t.index ["stock_transfer_id"], name: "index_spree_transfer_items_on_stock_transfer_id", using: :btree
    t.index ["variant_id"], name: "index_spree_transfer_items_on_variant_id", using: :btree
  end

  create_table "spree_unit_cancels", force: :cascade do |t|
    t.integer  "inventory_unit_id", null: false
    t.string   "reason"
    t.string   "created_by"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["inventory_unit_id"], name: "index_spree_unit_cancels_on_inventory_unit_id", using: :btree
  end

  create_table "spree_user_addresses", force: :cascade do |t|
    t.integer  "user_id",                    null: false
    t.integer  "address_id",                 null: false
    t.boolean  "default",    default: false
    t.boolean  "archived",   default: false
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.index ["address_id"], name: "index_spree_user_addresses_on_address_id", using: :btree
    t.index ["user_id", "address_id"], name: "index_spree_user_addresses_on_user_id_and_address_id", unique: true, using: :btree
    t.index ["user_id"], name: "index_spree_user_addresses_on_user_id", using: :btree
  end

  create_table "spree_user_authentications", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "provider"
    t.string   "uid"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "spree_user_prices", force: :cascade do |t|
    t.integer  "variant_id"
    t.integer  "user_id"
    t.string   "display"
    t.decimal  "amount",     precision: 10, scale: 2
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "role_id"
    t.string   "currency"
    t.index ["role_id"], name: "index_spree_user_prices_on_role_id", using: :btree
  end

  create_table "spree_user_stock_locations", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "stock_location_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["user_id"], name: "index_spree_user_stock_locations_on_user_id", using: :btree
  end

  create_table "spree_users", force: :cascade do |t|
    t.string   "encrypted_password",     limit: 128
    t.string   "password_salt",          limit: 128
    t.string   "email"
    t.string   "remember_token"
    t.string   "persistence_token"
    t.string   "reset_password_token"
    t.string   "perishable_token"
    t.integer  "sign_in_count",                      default: 0, null: false
    t.integer  "failed_attempts",                    default: 0, null: false
    t.datetime "last_request_at"
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "login"
    t.integer  "ship_address_id"
    t.integer  "bill_address_id"
    t.string   "authentication_token"
    t.string   "unlock_token"
    t.datetime "locked_at"
    t.datetime "reset_password_sent_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "spree_api_key",          limit: 48
    t.datetime "remember_created_at"
    t.datetime "deleted_at"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "stripe_customer_id"
    t.integer  "supplier_id"
    t.index ["deleted_at"], name: "index_spree_users_on_deleted_at", using: :btree
    t.index ["email"], name: "email_idx_unique", unique: true, using: :btree
    t.index ["spree_api_key"], name: "index_spree_users_on_spree_api_key", using: :btree
    t.index ["supplier_id"], name: "index_spree_users_on_supplier_id", using: :btree
  end

  create_table "spree_variant_property_rule_conditions", force: :cascade do |t|
    t.integer  "option_value_id"
    t.integer  "variant_property_rule_id"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.index ["variant_property_rule_id", "option_value_id"], name: "index_spree_variant_prop_rule_conditions_on_rule_and_optval", using: :btree
  end

  create_table "spree_variant_property_rule_values", force: :cascade do |t|
    t.text     "value"
    t.integer  "position",                 default: 0
    t.integer  "property_id"
    t.integer  "variant_property_rule_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["property_id"], name: "index_spree_variant_property_rule_values_on_property_id", using: :btree
    t.index ["variant_property_rule_id"], name: "index_spree_variant_property_rule_values_on_rule", using: :btree
  end

  create_table "spree_variant_property_rules", force: :cascade do |t|
    t.integer  "product_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_spree_variant_property_rules_on_product_id", using: :btree
  end

  create_table "spree_variants", force: :cascade do |t|
    t.string   "sku",                                      default: "",    null: false
    t.decimal  "weight",          precision: 8,  scale: 2, default: "0.0"
    t.decimal  "height",          precision: 8,  scale: 2
    t.decimal  "width",           precision: 8,  scale: 2
    t.decimal  "depth",           precision: 8,  scale: 2
    t.datetime "deleted_at"
    t.boolean  "is_master",                                default: false
    t.integer  "product_id"
    t.decimal  "cost_price",      precision: 10, scale: 2
    t.integer  "position"
    t.string   "cost_currency"
    t.boolean  "track_inventory",                          default: true
    t.integer  "tax_category_id"
    t.datetime "updated_at"
    t.datetime "created_at"
    t.integer  "shipwire_id"
    t.boolean  "subscribable",                             default: false
    t.index ["position"], name: "index_spree_variants_on_position", using: :btree
    t.index ["product_id"], name: "index_spree_variants_on_product_id", using: :btree
    t.index ["sku"], name: "index_spree_variants_on_sku", using: :btree
    t.index ["tax_category_id"], name: "index_spree_variants_on_tax_category_id", using: :btree
    t.index ["track_inventory"], name: "index_spree_variants_on_track_inventory", using: :btree
  end

  create_table "spree_wallet_payment_sources", force: :cascade do |t|
    t.integer  "user_id",                             null: false
    t.string   "payment_source_type",                 null: false
    t.integer  "payment_source_id",                   null: false
    t.boolean  "default",             default: false, null: false
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.index ["user_id", "payment_source_id", "payment_source_type"], name: "index_spree_wallet_payment_sources_on_source_and_user", unique: true, using: :btree
    t.index ["user_id"], name: "index_spree_wallet_payment_sources_on_user_id", using: :btree
  end

  create_table "spree_wished_products", force: :cascade do |t|
    t.integer  "variant_id"
    t.integer  "wishlist_id"
    t.text     "remark"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.integer  "quantity",    default: 1, null: false
  end

  create_table "spree_wishlists", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "name"
    t.string   "access_hash"
    t.boolean  "is_private",  default: true,  null: false
    t.boolean  "is_default",  default: false, null: false
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.index ["user_id", "is_default"], name: "index_spree_wishlists_on_user_id_and_is_default", using: :btree
    t.index ["user_id"], name: "index_spree_wishlists_on_user_id", using: :btree
  end

  create_table "spree_zone_members", force: :cascade do |t|
    t.string   "zoneable_type"
    t.integer  "zoneable_id"
    t.integer  "zone_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["zone_id"], name: "index_spree_zone_members_on_zone_id", using: :btree
    t.index ["zoneable_id", "zoneable_type"], name: "index_spree_zone_members_on_zoneable_id_and_zoneable_type", using: :btree
  end

  create_table "spree_zones", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.boolean  "default_tax",        default: false
    t.integer  "zone_members_count", default: 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "taggings", force: :cascade do |t|
    t.integer  "tag_id"
    t.string   "taggable_type"
    t.integer  "taggable_id"
    t.string   "tagger_type"
    t.integer  "tagger_id"
    t.string   "context",       limit: 128
    t.datetime "created_at"
    t.index ["context"], name: "index_taggings_on_context", using: :btree
    t.index ["tag_id", "taggable_id", "taggable_type", "context", "tagger_id", "tagger_type"], name: "taggings_idx", unique: true, using: :btree
    t.index ["tag_id"], name: "index_taggings_on_tag_id", using: :btree
    t.index ["taggable_id", "taggable_type", "context"], name: "index_taggings_on_taggable_id_and_taggable_type_and_context", using: :btree
    t.index ["taggable_id", "taggable_type", "tagger_id", "context"], name: "taggings_idy", using: :btree
    t.index ["taggable_id"], name: "index_taggings_on_taggable_id", using: :btree
    t.index ["taggable_type"], name: "index_taggings_on_taggable_type", using: :btree
    t.index ["tagger_id", "tagger_type"], name: "index_taggings_on_tagger_id_and_tagger_type", using: :btree
    t.index ["tagger_id"], name: "index_taggings_on_tagger_id", using: :btree
  end

  create_table "tags", force: :cascade do |t|
    t.string  "name"
    t.integer "taggings_count", default: 0
    t.index ["name"], name: "index_tags_on_name", unique: true, using: :btree
  end

  add_foreign_key "alchemy_cells", "alchemy_pages", column: "page_id", name: "alchemy_cells_page_id_fkey", on_update: :cascade, on_delete: :cascade
  add_foreign_key "alchemy_contents", "alchemy_elements", column: "element_id", name: "alchemy_contents_element_id_fkey", on_update: :cascade, on_delete: :cascade
  add_foreign_key "alchemy_elements", "alchemy_cells", column: "cell_id", name: "alchemy_elements_cell_id_fkey", on_update: :cascade, on_delete: :cascade
  add_foreign_key "alchemy_elements", "alchemy_pages", column: "page_id", name: "alchemy_elements_page_id_fkey", on_update: :cascade, on_delete: :cascade
  add_foreign_key "solidus_paypal_braintree_sources", "spree_payment_methods", column: "payment_method_id"
  add_foreign_key "solidus_subscriptions_installment_details", "solidus_subscriptions_installments", column: "installment_id"
  add_foreign_key "solidus_subscriptions_installment_details", "spree_orders", column: "order_id"
  add_foreign_key "solidus_subscriptions_installments", "solidus_subscriptions_subscriptions", column: "subscription_id"
  add_foreign_key "solidus_subscriptions_line_items", "solidus_subscriptions_subscriptions", column: "subscription_id"
  add_foreign_key "solidus_subscriptions_line_items", "spree_line_items"
  add_foreign_key "solidus_subscriptions_subscriptions", "spree_addresses", column: "shipping_address_id"
  add_foreign_key "solidus_subscriptions_subscriptions", "spree_stores", column: "store_id"
  add_foreign_key "spree_adjustments", "spree_orders", column: "order_id", name: "fk_spree_adjustments_order_id", on_update: :restrict, on_delete: :restrict
  add_foreign_key "spree_product_promotion_rules", "spree_products", column: "product_id"
  add_foreign_key "spree_product_promotion_rules", "spree_promotion_rules", column: "promotion_rule_id"
  add_foreign_key "spree_promotion_code_batches", "spree_promotions", column: "promotion_id"
  add_foreign_key "spree_promotion_codes", "spree_promotion_code_batches", column: "promotion_code_batch_id"
  add_foreign_key "spree_prototype_taxons", "spree_prototypes", column: "prototype_id"
  add_foreign_key "spree_prototype_taxons", "spree_taxons", column: "taxon_id"
  add_foreign_key "spree_shipping_method_stock_locations", "spree_shipping_methods", column: "shipping_method_id"
  add_foreign_key "spree_shipping_method_stock_locations", "spree_stock_locations", column: "stock_location_id"
  add_foreign_key "spree_wallet_payment_sources", "spree_users", column: "user_id"
end
