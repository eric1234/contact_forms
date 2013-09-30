class ContactFormsController < ApplicationController

  def index
    @contact_forms = ContactForm.order 'name'
  end

  def show
    @contact_form = ContactForm.find params[:id]
  end

  def edit
    @contact_form = ContactForm.find params[:id]
  end

  def update
    edit
    %I(
      to from success_message enable_auto_response auto_response_message
      auto_response_subject subject intro
    ).each do |field|
      @contact_form.send "#{field}=", params[:contact_form][field]
    end
    if @contact_form.save
      redirect_to [params[:return_to], contact_forms_url].reject(&:blank?).first
      flash[:notice] = 'Contact form response updated'
    else
      render :action => 'edit'
    end
  end

end
