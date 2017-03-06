class UserMailer < ApplicationMailer
  default from: "jmloftus13@yahoo.com"

  def contact_form(email, name, message)
    @message = message
    mail(:from => email,
        :to => 'jmloftus13@yahoo.com',
        :subject => "A new contact form message from #{name}")
  end

  def send_new_user_message(user)
    @user = user
    mail(:to => 'jmloftus13@yahoo.com', 
        :subject => "New User created please review and enable.")
  end

end