class Ability
  include CanCan::Ability

  def initialize( user )
    user ||= User.new # guest user

    can :read, Entry
    can :create, Entry do |entry|
      EXCHANGE_STARTERS.empty? ? !user.new_record? : EXCHANGE_STARTERS.include?( user.username )
    end
    can :create, Comment
  end
end
