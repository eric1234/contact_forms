class ContactForm < ActiveRecord::Base
  enforce_schema_rules
  alias_attribute :to_s, :name

  def key
    name.underscore.gsub /\W+/, '_'
  end
end
