class Ability
  include CanCan::Ability

  def initialize(user)
      user ||= User.new # guest user

      if user.role? :superadmin
        can :manage, :all
      elsif user.role? :administrator
        can :update, :all
        can :new, :all
        can :read, [User]
        can :manage, [Role]
      elsif user.role? :operator
        can :read, [User]
        can :manage, [Role]
      else
        can :manage, [Role]
      end
    end
  end
