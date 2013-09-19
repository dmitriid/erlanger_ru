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

ActiveRecord::Schema.define(version: 20130915104945) do

  create_table :articles, force: true do |t|
    t.integer  :resource_id
    t.string   :title
    t.string   :body
    t.string   :format
    t.string   :rendered
    t.string   :lang
    t.string   :slug
    t.datetime :created_at
    t.datetime :updated_at
  end

  create_table :authors, force: true do |t|
    t.integer  :resource_id
    t.string   :name
    t.datetime :created_at
    t.datetime :updated_at
    t.string   :lang
    t.string   :slug
  end

  create_table :countries, force: true do |t|
    t.integer  :resource_id
    t.string   :name
    t.string   :lang
    t.string   :slug
  end

  create_table :cities, force: true do |t|
    t.integer  :resource_id
    t.string   :name
    t.string   :lang
    t.string   :slug
  end

  create_table :events, force: true do |t|
    t.integer  :resource_id
    t.string   :title
    t.string   :body
    t.string   :format
    t.string   :rendered
    t.string   :lang
    t.string   :slug
    t.string   :address
    t.datetime :created_at
    t.datetime :updated_at
    t.datetime :created_at
    t.datetime :updated_at
  end

  create_table :news, force: true do |t|
    t.integer  :resource_id
    t.string   :title
    t.string   :body
    t.string   :format
    t.string   :rendered
    t.string   :lang
    t.string   :slug
    t.datetime :created_at
    t.datetime :updated_at
  end

  create_table :tags, force: true do |t|
    t.integer :resource_id
    t.string  :text
    t.string  :lang
  end

  create_table :urls, force: true do |t|
    t.integer  :resource_id
    t.string   :url
    t.string   :name
    t.string   :lang
    t.datetime :created_at
    t.datetime :updated_at
  end

  create_table :resources, force: true do |t|
    t.string   :resource_type
  end

  create_table :resource_links, force: true do |t|
    t.integer  :from_resource_id
    t.integer  :to_resource_id
  end

end
