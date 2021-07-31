class CreateProjects < ActiveRecord::Migration[6.1]
  def change
    create_table :projects do |t|
      t.timestamps
    end

    create_table :teams do |t|
      t.timestamps
    end

    create_table :tasks do |t|
      t.timestamps
    end

    create_table :users do |t|
      t.string :email, null: false
      t.string :password, null: false
      t.string :name, null: false
      t.string :public_name, limit: 255
      t.datetime :deleted_at
      t.string :occupation_name, limit: 255
      t.string :department_name, limit: 255
      t.string :organization_name, limit: 255
      t.integer :role, limit: 1, null: false
      t.integer :status, limit: 1, null:false
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

    # TODO: サブドメインについてちゃんと調べる
    create_table :sites do |t|
      t.string :url
      t.timestamps
    end
  end
end
