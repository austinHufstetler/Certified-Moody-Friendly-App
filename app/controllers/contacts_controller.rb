class ContactsController < ApplicationController
  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(params[:contact])
    @contact.request = request

    respond_to do |format|
      if @contact.deliver
        format.html {redirect_to businesses_path, notice: 'Thank you for your message. We will contact you soon!'}
      else
        flash.now[:error] = 'Cannot send message.'
        render :new
      end
    end
  end
end