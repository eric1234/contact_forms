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
    if @contact_form.update_attributes params[:contact_form]
      redirect_to [params[:return_to], contact_forms_url].reject(&:blank?).first
      flash[:notice] = 'Contact form response updated'
    else
      render :action => 'edit'
    end
  end

end
