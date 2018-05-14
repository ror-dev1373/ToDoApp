class CreateProjects < ActiveRecord::Migration[5.2]
  def change
    create_table :projects do |t|
    	t.belongs_to :user, index: true
      t.string :name, null: false, default: ""
    	t.text :description
      t.timestamps
    end
  end
end
