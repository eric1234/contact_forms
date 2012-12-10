module ContactForms
  class Engine < Rails::Engine
    initializer 'contact_forms.mail_config' do
      Mail.defaults do
        delivery_method Rails.application.config.action_mailer.delivery_method
      end
    end
  end
end
