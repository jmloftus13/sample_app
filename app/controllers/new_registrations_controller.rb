class NewRegistrationsController < Devise::RegistrationsController

  def create
    super
    if @user.persisted?
      UserMailer.new_registrations(@user).deliver
    end
  end

end