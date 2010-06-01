class Ability
  include CanCan::Ability

  def initialize( user )
    user ||= User.new # guest user

    can :read, Entry
    can :create, Entry do |entry|
      EXCHANGE_STARTERS.empty? ? !user.new_record? : EXCHANGE_STARTERS.include?( user.username )
    end
    can :create, Comment
    can :read, Exchange
    can :create, Exchange do |exchange|
      exchange.users.first == user
    end
    can :update, Exchange do |exchange|
      exchange.users.include?( user )
    end
  end
end
