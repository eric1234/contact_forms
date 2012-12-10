Rails.application.routes.draw do
  resources :contact_forms, :only => [:index, :edit, :update, :show]

  ContactForm.all.each do |contact_form|
    match "/contact_forms/#{contact_form.key}" => Rack::Mailer.new {
      contact_form.reload # Check for changes

      to contact_form.to
      subject "Website Message - #{contact_form.name}"
      body "A message was received from the #{contact_form.name} contact form:\n\n"

      success_url "/contact_forms/#{contact_form.to_param}"

      if contact_form.enable_auto_response?
        auto_responder do |params|
          to params['email']
          from contact_form.to
          subject contact_form.auto_response_subject
          body contact_form.auto_response_message
        end
      end

      spam_field 'email2'
    }
  end if ContactForm.table_exists?
end
