class Ability
  include CanCan::Ability

  def initialize(user) #initialize method
    user ||= User.new  #guest user (not logged in)
    can :manager, User, id: user.id
  end

end
