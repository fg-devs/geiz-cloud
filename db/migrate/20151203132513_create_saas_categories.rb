class CreateSaasCategories < ActiveRecord::Migration
  def change
    create_table :saas_categories do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
