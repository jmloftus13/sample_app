class UserMailer < ApplicationMailer
  default from: "jmloftus13@yahoo.com"

  def contact_form(email, name, message)
    @message = message
    mail(:from => email,
        :to => 'jmloftus13@yahoo.com',
        :subject => "A new contact form message from #{name}")
  end

  #trying to do thing through the controller instead
  def new_registrations(user)
   @user = user
    mail(:to => @user.email, 
        :subject => "New User created please review and enable.")
  end

end