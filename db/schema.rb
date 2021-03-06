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

ActiveRecord::Schema.define(version: 20170519213833) do

  create_table "categoria", force: :cascade do |t|
    t.string   "codigo",      limit: 255
    t.string   "descripcion", limit: 255
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "empleados", force: :cascade do |t|
    t.integer  "nro_legajo",        limit: 4
    t.integer  "tipo_documento_id", limit: 4
    t.integer  "nro_documento",     limit: 8
    t.string   "apellido",          limit: 255
    t.string   "nombre",            limit: 255
    t.datetime "fecha_alta"
    t.datetime "fecha_baja"
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
  end

  add_index "empleados", ["tipo_documento_id"], name: "index_empleados_on_tipo_documento_id", using: :btree

  create_table "estado_medidors", force: :cascade do |t|
    t.integer  "novedad_id",         limit: 4
    t.integer  "user_id",            limit: 4
    t.integer  "estado_actual",      limit: 4
    t.integer  "estado_anterior",    limit: 4
    t.integer  "promedio",           limit: 4
    t.integer  "demanda",            limit: 4
    t.string   "observacion",        limit: 255
    t.datetime "fecha_medicion"
    t.datetime "fecha_modificacion"
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.string   "periodo",            limit: 255
  end

  add_index "estado_medidors", ["novedad_id"], name: "index_estado_medidors_on_novedad_id", using: :btree
  add_index "estado_medidors", ["user_id"], name: "index_estado_medidors_on_user_id", using: :btree

  create_table "grupos", force: :cascade do |t|
    t.string   "nombre",      limit: 255
    t.string   "descripcion", limit: 255
    t.integer  "codigo",      limit: 4
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "medidor_estado_medidors", force: :cascade do |t|
    t.integer  "medidor_id",        limit: 4
    t.integer  "estado_medidor_id", limit: 4
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  add_index "medidor_estado_medidors", ["estado_medidor_id"], name: "index_medidor_estado_medidors_on_estado_medidor_id", using: :btree
  add_index "medidor_estado_medidors", ["medidor_id"], name: "index_medidor_estado_medidors_on_medidor_id", using: :btree

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
    t.integer  "codigo",          limit: 4
    t.string   "descripcion",     limit: 255
    t.integer  "prioridad_id",    limit: 4
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.string   "codigo_servicio", limit: 255
    t.boolean  "repite_estado"
  end

  add_index "novedads", ["prioridad_id"], name: "index_novedads_on_prioridad_id", using: :btree

  create_table "personas", force: :cascade do |t|
    t.integer  "tipo_documento_id", limit: 4
    t.integer  "nro_documento",     limit: 8
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
    t.integer  "valor",       limit: 4
  end

  create_table "roles", force: :cascade do |t|
    t.string   "descripcion", limit: 255
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "ruta", force: :cascade do |t|
    t.integer  "numero",      limit: 4
    t.string   "nombre",      limit: 255
    t.integer  "zona_id",     limit: 4
    t.string   "descripcion", limit: 255
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  add_index "ruta", ["zona_id"], name: "index_ruta_on_zona_id", using: :btree

  create_table "ruta_users", force: :cascade do |t|
    t.integer  "rutum_id",   limit: 4
    t.integer  "user_id",    limit: 4
    t.datetime "fecha_alta"
    t.datetime "fecha_baja"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  add_index "ruta_users", ["rutum_id"], name: "index_ruta_users_on_rutum_id", using: :btree
  add_index "ruta_users", ["user_id"], name: "index_ruta_users_on_user_id", using: :btree

  create_table "ruta_usuarios", force: :cascade do |t|
    t.integer  "rutum_id",   limit: 4
    t.integer  "usuario_id", limit: 4
    t.datetime "fecha_alta"
    t.datetime "fecha_baja"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  add_index "ruta_usuarios", ["rutum_id"], name: "index_ruta_usuarios_on_rutum_id", using: :btree
  add_index "ruta_usuarios", ["usuario_id"], name: "index_ruta_usuarios_on_usuario_id", using: :btree

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

  create_table "user_roles", force: :cascade do |t|
    t.integer  "user_id",    limit: 4
    t.integer  "role_id",    limit: 4
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  add_index "user_roles", ["role_id"], name: "index_user_roles_on_role_id", using: :btree
  add_index "user_roles", ["user_id"], name: "index_user_roles_on_user_id", using: :btree

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
    t.integer  "empleado_id",            limit: 4
    t.string   "authentication_token",   limit: 255
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["empleado_id"], name: "fk_rails_8bb6b07f16", using: :btree
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
    t.integer  "categorium_id",      limit: 4
    t.integer  "numero",             limit: 4
    t.string   "razon_social",       limit: 255
    t.string   "domicilio_postal",   limit: 255
    t.string   "domicilio_servicio", limit: 255
    t.integer  "circunscripcion",    limit: 4
    t.integer  "sector",             limit: 4
    t.integer  "tipo",               limit: 4
    t.integer  "manzana",            limit: 4
    t.integer  "parcela",            limit: 4
    t.integer  "unidad_funcional",   limit: 4
    t.string   "latitud",            limit: 255
    t.string   "longitud",           limit: 255
    t.integer  "persona_id",         limit: 4
    t.datetime "fecha_alta"
    t.datetime "fecha_baja"
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
  end

  add_index "usuarios", ["categorium_id"], name: "index_usuarios_on_categorium_id", using: :btree
  add_index "usuarios", ["persona_id"], name: "index_usuarios_on_persona_id", using: :btree

  create_table "zonas", force: :cascade do |t|
    t.string   "nombre",     limit: 255
    t.integer  "grupo_id",   limit: 4
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "zonas", ["grupo_id"], name: "index_zonas_on_grupo_id", using: :btree

  add_foreign_key "empleados", "tipo_documentos"
  add_foreign_key "estado_medidors", "novedads"
  add_foreign_key "estado_medidors", "users"
  add_foreign_key "medidor_estado_medidors", "estado_medidors"
  add_foreign_key "medidor_estado_medidors", "medidors"
  add_foreign_key "medidors", "tipo_medidors"
  add_foreign_key "novedads", "prioridads"
  add_foreign_key "personas", "tipo_documentos"
  add_foreign_key "ruta", "zonas"
  add_foreign_key "ruta_users", "ruta"
  add_foreign_key "ruta_users", "users"
  add_foreign_key "ruta_usuarios", "ruta"
  add_foreign_key "ruta_usuarios", "usuarios"
  add_foreign_key "user_roles", "roles"
  add_foreign_key "user_roles", "users"
  add_foreign_key "users", "empleados"
  add_foreign_key "usuario_medidors", "medidors"
  add_foreign_key "usuario_medidors", "usuarios"
  add_foreign_key "usuarios", "categoria"
  add_foreign_key "usuarios", "personas"
  add_foreign_key "zonas", "grupos"
end
