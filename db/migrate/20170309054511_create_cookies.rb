class CreateCookies < ActiveRecord::Migration[5.0]
  def change
    create_table :cookies do |t|
      t.string :name
      t.text :description
      t.string :jar_size
      t.text :allergans

      t.timestamps
    end
  end
end
