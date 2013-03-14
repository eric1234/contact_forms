class FromCustomization < ActiveRecord::Migration

  def change
    add_column :contact_forms, :from, :string
  end

end
