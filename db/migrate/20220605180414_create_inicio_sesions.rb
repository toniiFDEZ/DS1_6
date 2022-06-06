class CreateInicioSesions < ActiveRecord::Migration[7.0]
  def change
    create_table :inicio_sesions do |t|
      t.string :usuario
      t.string :password

      t.timestamps
    end
  end
end
