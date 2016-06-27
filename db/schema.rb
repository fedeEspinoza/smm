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

ActiveRecord::Schema.define(version: 20160627211315) do

  create_table "categoria", force: :cascade do |t|
    t.string   "codigo",      limit: 255
    t.string   "descripcion", limit: 255
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "grupos", force: :cascade do |t|
    t.string   "nombre",      limit: 255
    t.string   "descripcion", limit: 255
    t.integer  "codigo",      limit: 4
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "medidors", force: :cascade do |t|
    t.integer  "numero",          limit: 4
    t.integer  "multiplicador",   limit: 4
    t.integer  "tipo_medidor_id", limit: 4
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  add_index "medidors", ["tipo_medidor_id"], name: "index_medidors_on_tipo_medidor_id", using: :btree

  create_table "novedads", force: :cascade do |t|
    t.integer  "codigo",       limit: 4
    t.string   "descripcion",  limit: 255
    t.integer  "prioridad_id", limit: 4
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  add_index "novedads", ["prioridad_id"], name: "index_novedads_on_prioridad_id", using: :btree

  create_table "prioridads", force: :cascade do |t|
    t.string   "descripcion", limit: 255
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "tipo_documentos", force: :cascade do |t|
    t.string   "descripcion", limit: 255
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "tipo_medidors", force: :cascade do |t|
    t.string   "nombre",      limit: 255
    t.integer  "codigo",      limit: 4
    t.string   "descripcion", limit: 255
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "zonas", force: :cascade do |t|
    t.string   "nombre",     limit: 255
    t.integer  "grupo_id",   limit: 4
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "zonas", ["grupo_id"], name: "index_zonas_on_grupo_id", using: :btree

  add_foreign_key "medidors", "tipo_medidors"
  add_foreign_key "novedads", "prioridads"
  add_foreign_key "zonas", "grupos"
end
