class CreateTimecards < ActiveRecord::Migration
  def change
    create_table :timecards do |t|
      t.datetime :pay_period_end_date
      t.datetime :date
      t.integer :user_id
      t.integer :job_id
      t.integer :phase_id
      t.integer :equipment_id
      t.string :tax_state
      t.string :unemployment_state
      t.string :insurance_state
      t.integer :insurance_code
      t.integer :crew_id
      t.boolean :certified_payroll
      t.integer :craft_id
      t.integer :craft_class_id
      t.integer :earnings_type_id
      t.decimal :hours
      t.decimal :wage
      t.decimal :amount, precision: 15, scale: 2
      t.string :notes

      t.timestamps
    end
    add_index :timecards, [:user_id, :created_at]
  end
end
