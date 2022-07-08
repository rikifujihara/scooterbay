class DropPages < ActiveRecord::Migration[6.1]
  def change
    drop_table :pages
  end
end
