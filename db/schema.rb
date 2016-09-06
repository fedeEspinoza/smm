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

ActiveRecord::Schema.define(version: 20160906231612) do

  create_table "categoria", force: :cascade do |t|
    t.string   "codigo",      limit: 255
    t.string   "descripcion", limit: 255
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "estados", force: :cascade do |t|
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

  create_table "historial_medicions", force: :cascade do |t|
    t.integer  "novedad_id",         limit: 4
    t.integer  "medidor_id",         limit: 4
    t.integer  "user_id",            limit: 4
    t.integer  "estado_medidor",     limit: 4
    t.datetime "fecha_medicion"
    t.datetime "fecha_modificacion"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
  end

  add_index "historial_medicions", ["medidor_id"], name: "index_historial_medicions_on_medidor_id", using: :btree
  add_index "historial_medicions", ["novedad_id"], name: "index_historial_medicions_on_novedad_id", using: :btree
  add_index "historial_medicions", ["user_id"], name: "index_historial_medicions_on_user_id", using: :btree

  create_table "medidors", force: :cascade do |t|
    t.integer  "numero",          limit: 4
    t.integer  "multiplicador",   limit: 4
    t.string   "marca",           limit: 255
    t.string   "modelo",          limit: 255
    t.datetime "fecha_alta"
    t.datetime "fecha_baja"
    t.integer  "tipo_medidor_id", limit: 4
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
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

  create_table "personas", force: :cascade do |t|
    t.integer  "tipo_documento_id", limit: 4
    t.integer  "nro_documento",     limit: 4
    t.string   "apellido",          limit: 255
    t.string   "nombre",            limit: 255
    t.string   "telefono",          limit: 255
    t.string   "email",             limit: 255
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
  end

  add_index "personas", ["tipo_documento_id"], name: "index_personas_on_tipo_documento_id", using: :btree

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

  create_table "users", force: :cascade do |t|
    t.string   "email",                  limit: 255, default: "", null: false
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "usuario_medidors", force: :cascade do |t|
    t.integer  "usuario_id", limit: 4
    t.integer  "medidor_id", limit: 4
    t.datetime "fecha_alta"
    t.datetime "fecha_baja"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  add_index "usuario_medidors", ["medidor_id"], name: "index_usuario_medidors_on_medidor_id", using: :btree
  add_index "usuario_medidors", ["usuario_id"], name: "index_usuario_medidors_on_usuario_id", using: :btree

  create_table "usuarios", force: :cascade do |t|
    t.integer  "categorium_id",    limit: 4
    t.integer  "numero",           limit: 4
    t.string   "razon_social",     limit: 255
    t.string   "domicilio",        limit: 255
    t.integer  "circunscripcion",  limit: 4
    t.integer  "sector",           limit: 4
    t.integer  "tipo",             limit: 4
    t.integer  "manzana",          limit: 4
    t.integer  "parcela",          limit: 4
    t.integer  "unidad_funcional", limit: 4
    t.string   "latitud",          limit: 255
    t.string   "longitud",         limit: 255
    t.integer  "estado_id",        limit: 4
    t.integer  "persona_id",       limit: 4
    t.datetime "fecha_alta"
    t.datetime "fecha_baja"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
  end

  add_index "usuarios", ["categorium_id"], name: "index_usuarios_on_categorium_id", using: :btree
  add_index "usuarios", ["estado_id"], name: "index_usuarios_on_estado_id", using: :btree
  add_index "usuarios", ["persona_id"], name: "index_usuarios_on_persona_id", using: :btree

  create_table "zona_usuarios", force: :cascade do |t|
    t.integer  "zona_id",    limit: 4
    t.integer  "usuario_id", limit: 4
    t.integer  "orden",      limit: 4
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  add_index "zona_usuarios", ["usuario_id"], name: "index_zona_usuarios_on_usuario_id", using: :btree
  add_index "zona_usuarios", ["zona_id"], name: "index_zona_usuarios_on_zona_id", using: :btree

  create_table "zonas", force: :cascade do |t|
    t.string   "nombre",     limit: 255
    t.integer  "grupo_id",   limit: 4
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "zonas", ["grupo_id"], name: "index_zonas_on_grupo_id", using: :btree

  add_foreign_key "historial_medicions", "medidors"
  add_foreign_key "historial_medicions", "novedads"
  add_foreign_key "historial_medicions", "users"
  add_foreign_key "medidors", "tipo_medidors"
  add_foreign_key "novedads", "prioridads"
  add_foreign_key "personas", "tipo_documentos"
  add_foreign_key "usuario_medidors", "medidors"
  add_foreign_key "usuario_medidors", "usuarios"
  add_foreign_key "usuarios", "categoria"
  add_foreign_key "usuarios", "estados"
  add_foreign_key "usuarios", "personas"
  add_foreign_key "zona_usuarios", "usuarios"
  add_foreign_key "zona_usuarios", "zonas"
  add_foreign_key "zonas", "grupos"
end
