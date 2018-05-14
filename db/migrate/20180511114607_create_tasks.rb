class CreateTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :tasks do |t|
    	t.belongs_to :project, index: true
    	t.string :name, null: false, default: ""
    	t.text :description
    	t.integer :priority, default: 2
    	t.datetime :deadline
    	t.integer :status, default: 0
      t.timestamps
    end
  end
end
