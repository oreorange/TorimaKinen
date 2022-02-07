class ContactsController < ApplicationController
  def new
    @contact = Contact.new
  end
  
  def create
    @contact = Contact.new(contact_params)
    if @contact.save
      ContactMailer.send_mail(@contact).deliver_now
      redirect_to homes_support_path
    else
      render :new
    end
  end
  
  private

  def contact_params
    params.require(:contact).permit(:name, :email, :message)
  end
  
end
