class CreateRealEstates < ActiveRecord::Migration[6.1]
  def change
    create_table :real_estates do |t|

      t.timestamps
    end
  end
end
