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
      t.timestamps
    end

    create_table :operators do |t|
      t.timestamps
    end

    create_table :task_logs do |t|
      t.timestamps
    end

    create_table :plans do |t|
      t.timestamps
    end
  end
end
