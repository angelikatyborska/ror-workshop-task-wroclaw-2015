class AddChangeColumnNullToPayments < ActiveRecord::Migration
  def change
    change_column_null :payments, :student_id, false
    change_column_null :payments, :amount, false
    change_column_null :payments, :date, false
  end
end
