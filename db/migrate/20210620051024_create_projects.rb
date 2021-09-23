class CreateProjects < ActiveRecord::Migration[6.1]
  def change
    create_table :article_files do |t|
      t.string :name, null: false, limit: 255
      t.string :slug, null: false, limit: 255
      t.string :file_url, null: false
      t.integer :file_type, null: false
      t.json :data
      t.integer :file_size, null: false
      t.timestamps
      t.index ["file_type"]
    end

    create_table :articles do |t|
      t.string :title, null: false, limit: 255
      t.text :content, null: false
      t.datetime :released_at
      t.integer :status, null: false, limit: 1, default: 0
      t.timestamps
    end

    # TODO: サブドメインについてちゃんと調べる
    create_table :sites do |t|
      t.string :url
      t.timestamps
    end

    create_table :projects do |t|
      t.references :site, type: :bigint, foreign_key: true, null: false
      t.string :title, null: false
      t.string :key, null: false
      t.timestamps
    end

    create_table :teams do |t|
      t.timestamps
    end

    create_table :tasks do |t|
      t.string :title
      t.references :project, type: :bigint, foreign_key: true
      t.timestamps
    end

    create_table :task_sub_tasks do |t|
      t.references :task, type: :bigint, null: false, foreign_key: true
      t.references :sub_task, type: :bigint, null: false, foreign_key: { to_table: :tasks }
      t.timestamps
    end

    create_table :users do |t|
      t.string :email, null: false
      t.string :encrypt_password, null: false
      t.string :name, null: false
      t.string :public_name, limit: 255
      t.datetime :deleted_at
      t.string :occupation_name, limit: 255
      t.string :department_name, limit: 255
      t.string :organization_name, limit: 255
      t.integer :role, limit: 1, null: false
      t.integer :status, limit: 1, null:false
      t.string :salt, limit: 255
      t.timestamps
    end

    create_table :operators do |t|
      t.string :email, null: false
      t.string :operator_name, null: false
      t.string :password_digest, null: false
      t.integer :role, limit: 1, null: false
      t.integer :status, limit: 1, null: false
      t.timestamps
    end

    create_table :task_logs do |t|
      t.timestamps
    end

    create_table :plans do |t|
      t.integer :title
      t.integer :max_person
      t.integer :max_sites
      t.integer :price
      t.timestamps
    end

    create_table :payments do |t|
      t.integer :status
      t.integer :amount
      t.timestamps
    end
  end
end
