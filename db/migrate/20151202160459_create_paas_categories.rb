class CreatePaasCategories < ActiveRecord::Migration
  def change
    create_table :paas_categories do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
