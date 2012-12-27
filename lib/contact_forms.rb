require 'rack_mailer'

module ContactForms
  class Engine < Rails::Engine
    config.after_initialize do
      Mail.defaults do
        method = Rails.application.config.action_mailer.delivery_method
        options = Rails.application.config.action_mailer.send("#{method}_settings".to_sym) || {}
        delivery_method method, options
      end
    end
  end
end
