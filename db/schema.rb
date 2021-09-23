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

ActiveRecord::Schema.define(version: 2021_06_20_051024) do

  create_table "article_files", charset: "utf8mb4", force: :cascade do |t|
    t.string "name", null: false
    t.string "slug", null: false
    t.string "file_url", null: false
    t.integer "file_type", null: false
    t.json "data"
    t.integer "file_size", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["file_type"], name: "index_article_files_on_file_type"
  end

  create_table "articles", charset: "utf8mb4", force: :cascade do |t|
    t.string "title", null: false
    t.text "content", null: false
    t.datetime "released_at"
    t.integer "status", limit: 1, default: 0, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "operators", charset: "utf8mb4", force: :cascade do |t|
    t.string "email", null: false
    t.string "operator_name", null: false
    t.string "password_digest", null: false
    t.integer "role", limit: 1, null: false
    t.integer "status", limit: 1, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "payments", charset: "utf8mb4", force: :cascade do |t|
    t.integer "status"
    t.integer "amount"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "plans", charset: "utf8mb4", force: :cascade do |t|
    t.integer "title"
    t.integer "max_person"
    t.integer "max_sites"
    t.integer "price"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "projects", charset: "utf8mb4", force: :cascade do |t|
    t.bigint "site_id", null: false
    t.string "title", null: false
    t.string "key", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["site_id"], name: "index_projects_on_site_id"
  end

  create_table "sites", charset: "utf8mb4", force: :cascade do |t|
    t.string "url"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "task_logs", charset: "utf8mb4", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "task_sub_tasks", charset: "utf8mb4", force: :cascade do |t|
    t.bigint "task_id", null: false
    t.bigint "sub_task_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["sub_task_id"], name: "index_task_sub_tasks_on_sub_task_id"
    t.index ["task_id"], name: "index_task_sub_tasks_on_task_id"
  end

  create_table "tasks", charset: "utf8mb4", force: :cascade do |t|
    t.string "title"
    t.bigint "project_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["project_id"], name: "index_tasks_on_project_id"
  end

  create_table "teams", charset: "utf8mb4", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", charset: "utf8mb4", force: :cascade do |t|
    t.string "email", null: false
    t.string "encrypt_password", null: false
    t.string "name", null: false
    t.string "public_name"
    t.datetime "deleted_at"
    t.string "occupation_name"
    t.string "department_name"
    t.string "organization_name"
    t.integer "role", limit: 1, null: false
    t.integer "status", limit: 1, null: false
    t.string "salt"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "projects", "sites"
  add_foreign_key "task_sub_tasks", "tasks"
  add_foreign_key "task_sub_tasks", "tasks", column: "sub_task_id"
  add_foreign_key "tasks", "projects"
end
