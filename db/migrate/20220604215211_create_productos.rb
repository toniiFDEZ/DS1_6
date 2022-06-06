class CreateProductos < ActiveRecord::Migration[7.0]
  def change
    create_table :productos do |t|
      t.string :nombre
      t.float :precio
      t.integer :cantidad
      t.string :color
      t.string :tipo

      t.timestamps
    end
  end
end
