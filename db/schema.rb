# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20130911195313) do

  create_table "countries", force: true do |t|
    t.string "country_iso3166"
    t.string "lang_iso639"
    t.string "country_name"
    t.string "lang_name"
  end

  add_index "countries", ["country_iso3166", "lang_iso639"], name: "countries_on_country_lang_code"
  add_index "countries", ["country_iso3166"], name: "countries_on_country"
  add_index "countries", ["lang_iso639"], name: "countries_on_lang"

  create_table "events", force: true do |t|
    t.string   "country_iso3166"
    t.string   "url"
    t.string   "googlemap_address"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "i18n_events", force: true do |t|
    t.integer "event_id"
    t.string  "lang_iso639"
    t.string  "city"
    t.string  "title"
    t.string  "info"
  end

  add_index "i18n_events", ["event_id", "lang_iso639"], name: "events_on_id_lang"

  create_table "event_tags", force: true do |t|
    t.integer  "event_id"
    t.integer  "tag_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "event_tags", ["event_id"], name: "index_event_tags_on_event_id"

  create_table "i18n_news", force: true do |t|
    t.integer "news_id"
    t.string  "lang_iso639"
    t.string  "title"
    t.string  "intro"
    t.string  "body"
  end

  add_index "i18n_news", ["news_id", "lang_iso639"], name: "news_on_id_lang"

  create_table "news", force: true do |t|
    t.integer  "created_by"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "news_tags", force: true do |t|
    t.integer  "news_id"
    t.integer  "tag_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "articles", force: true do |t|
    t.string "created_by"
    t.string "url"
    t.string "image_url"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "i18n_articles", force: true do |t|
    t.integer "article_id"
    t.string "lang_iso639"
    t.string "title"
    t.string "intro"
    t.string "body"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "article_tags", force: true do |t|
    t.integer  "article_id"
    t.integer  "tag_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "news_tags", ["news_id"], name: "index_news_tags_on_news_id"

  create_table "tags", force: true do |t|
    t.string   "text"
    t.string   "lang_iso639"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
