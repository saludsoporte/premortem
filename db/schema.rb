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

ActiveRecord::Schema[7.1].define(version: 2025_08_07_200206) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "areas", force: :cascade do |t|
    t.string "clave"
    t.string "nombre"
    t.string "depende_de"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "datos_personals", force: :cascade do |t|
    t.string "nombre"
    t.string "apellidos"
    t.string "puesto"
    t.string "titulo"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
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
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "datos_personals", "users"
  add_foreign_key "departamentos", "direccions"
  add_foreign_key "departamentos", "subdireccions"
  add_foreign_key "subdireccions", "direccions"
end
