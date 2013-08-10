class Ability  
  include CanCan::Ability  
  
  def initialize(user) 
    user ||= User.new # Creates guest user if not logged in.
    if user.role? :administrator
      can :manage, :all
    else
      can :read, Project, :publish => true
      can :read, Job, :publish => true
      can :read, Qualification, :publish => true
      can :read, Page, :publish => true
      can :create, User
      can :read, User
    end
  end
end