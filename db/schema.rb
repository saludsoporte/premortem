# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.1].define(version: 2025_09_24_153709) do
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
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum"
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "areas", force: :cascade do |t|
    t.string "clave"
    t.string "nombre"
    t.string "depende_de"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "busquedas", force: :cascade do |t|
    t.string "nombre_p"
    t.string "apellido_pp"
    t.string "apellido_mp"
    t.string "nombre_n"
    t.string "apellido_pn"
    t.string "apellido_mn"
    t.string "nombre_r"
    t.string "apellido_pr"
    t.string "apellido_mr"
    t.string "nombre_ro"
    t.string "apellido_pro"
    t.string "apellido_mro"
    t.string "no_documento"
    t.string "area"
    t.date "f_recp"
    t.date "f_disp"
    t.date "f_clon"
    t.string "no_inst"
    t.string "no_libro"
    t.string "no_notaria"
    t.string "no_conclusion"
    t.boolean "activa", default: false
    t.bigint "user_id", null: false
    t.string "observaciones"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_busquedas_on_user_id"
  end

  create_table "buzones", force: :cascade do |t|
    t.integer "area_id"
    t.boolean "direccion"
    t.boolean "subdireccion"
    t.boolean "departamento"
    t.bigint "documento_id", null: false
    t.bigint "estado_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["documento_id"], name: "index_buzones_on_documento_id"
    t.index ["estado_id"], name: "index_buzones_on_estado_id"
  end

  create_table "datos_personals", force: :cascade do |t|
    t.string "nombre"
    t.string "apellido_paterno"
    t.string "puesto"
    t.string "titulo"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "curp"
    t.string "apellido_materno"
    t.string "correo"
    t.index ["user_id"], name: "index_datos_personals_on_user_id"
  end

  create_table "departamentos", force: :cascade do |t|
    t.string "clave"
    t.string "nombre"
    t.boolean "activo"
    t.bigint "direccion_id", null: false
    t.bigint "subdireccion_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["direccion_id"], name: "index_departamentos_on_direccion_id"
    t.index ["subdireccion_id"], name: "index_departamentos_on_subdireccion_id"
  end

  create_table "direccions", force: :cascade do |t|
    t.string "clave"
    t.string "nombre"
    t.boolean "activo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "documentos", force: :cascade do |t|
    t.date "fecha_recepcion"
    t.string "no_documento"
    t.bigint "area_id", null: false
    t.string "no_libro"
    t.string "nombre_paciente"
    t.date "fecha_disp"
    t.string "nombre_notario"
    t.string "no_notaria"
    t.string "no_oficio_de_conclucion"
    t.date "fecha_conclucion"
    t.string "observaciones"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "nombre_responsable"
    t.string "apellido_p_paciente"
    t.string "apellido_m_paciente"
    t.string "apellido_p_notario"
    t.string "apellido_m_notario"
    t.string "apellido_p_responsable"
    t.string "apellido_m_responsable"
    t.string "nombre_res_op"
    t.string "apellido_p_res_op"
    t.string "apellido_m_res_op"
    t.string "no_instrumento"
    t.index ["area_id"], name: "index_documentos_on_area_id"
  end

  create_table "estados", force: :cascade do |t|
    t.string "estado"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "subdireccions", force: :cascade do |t|
    t.string "clave"
    t.string "nombre"
    t.boolean "activo"
    t.bigint "direccion_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["direccion_id"], name: "index_subdireccions_on_direccion_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: ""
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "username"
    t.integer "area_id"
    t.integer "rol", default: 0, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "busquedas", "users"
  add_foreign_key "buzones", "documentos"
  add_foreign_key "buzones", "estados"
  add_foreign_key "datos_personals", "users"
  add_foreign_key "departamentos", "direccions"
  add_foreign_key "departamentos", "subdireccions"
  add_foreign_key "documentos", "areas"
  add_foreign_key "subdireccions", "direccions"
end
