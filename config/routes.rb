Rails.application.routes.draw do
  resources :contact_forms, :only => [:index, :edit, :update, :show]

  ContactForm.all.each do |contact_form|
    post "/contact_forms/#{contact_form.key}" => Rack::Mailer.new {
      contact_form.reload # Check for changes
      sender = [contact_form.from, contact_form.to].reject(&:blank?).first

      to contact_form.to.split(',')
      from sender
      subject contact_form.subject
      body contact_form.intro.strip+"\n\n"

      success_url "/contact_forms/#{contact_form.to_param}"

      if contact_form.enable_auto_response?
        auto_responder do |params|
          to params['email']
          from sender
          subject contact_form.auto_response_subject
          body contact_form.auto_response_message
        end
      end

      spam_field 'email2'
    }
  end if ContactForm.table_exists?
end
