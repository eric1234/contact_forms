class SubjectBodyCustomization < ActiveRecord::Migration

  def change
    add_column :contact_forms, :subject, :string
    add_column :contact_forms, :intro, :string
  end

end
