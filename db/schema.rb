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

ActiveRecord::Schema.define(version: 2021_12_31_225607) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "actions", force: :cascade do |t|
    t.text "old"
    t.text "new"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "bullets", force: :cascade do |t|
    t.bigint "collection_id"
    t.bigint "pointer_id"
    t.text "body"
    t.integer "state"
    t.integer "bullet_type"
    t.boolean "priority"
    t.boolean "inspiration"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "ancestry"
    t.index ["ancestry"], name: "index_bullets_on_ancestry"
    t.index ["collection_id"], name: "index_bullets_on_collection_id"
    t.index ["pointer_id"], name: "index_bullets_on_pointer_id"
  end

  create_table "collections", force: :cascade do |t|
    t.integer "collection_type"
    t.date "start_date"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "migrations", force: :cascade do |t|
    t.bigint "from_id"
    t.bigint "to_id"
    t.string "reason"
    t.text "note"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["from_id"], name: "index_migrations_on_from_id"
    t.index ["to_id"], name: "index_migrations_on_to_id"
  end

  create_table "people", force: :cascade do |t|
    t.string "name"
    t.string "phone"
    t.string "email"
    t.string "relationship"
    t.date "birthdate"
    t.text "info"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "bullets", "bullets", column: "pointer_id"
  add_foreign_key "migrations", "bullets", column: "from_id"
  add_foreign_key "migrations", "bullets", column: "to_id"
end
