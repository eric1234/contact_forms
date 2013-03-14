class ContactForm < ActiveRecord::Base
  enforce_schema_rules
  alias_attribute :to_s, :name

  attr_accessible :to, :from, :success_message, :enable_auto_response,
    :auto_response_message, :auto_response_subject, :subject, :intro

  def key
    name.underscore.gsub /\W+/, '_'
  end
end
