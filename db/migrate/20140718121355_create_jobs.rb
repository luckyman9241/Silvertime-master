class CreateJobs < ActiveRecord::Migration
  def change
    create_table :jobs do |t|
      t.integer :number
      t.string :description
      t.integer :status
      t.string :customer
      t.string :address
      t.string :city
      t.string :state
      t.string :zip
      t.string :payroll_state
      t.boolean :certified_payroll
      t.integer :wage_template

      t.timestamps
    end
  end
end
