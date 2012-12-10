class CreateContactForm < ActiveRecord::Migration

  def change

    create_table :contact_forms do |t|
      t.string :name, :to, :null => false
      t.text :success_message, :null => false
      t.boolean :enable_auto_response, :null => false, :default => false
      t.text :auto_response_message
      t.string :auto_response_subject
    end

  end

end
