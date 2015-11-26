class CreatePayments < ActiveRecord::Migration
  def change
    create_table :payments do |t|
      t.float :amount
      t.references :student, index: true, foreign_key: true
      t.date :date

      t.timestamps null: false
    end
  end
end
