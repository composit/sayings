class Ability
  include CanCan::Ability

  def initialize( user )
    user ||= User.new # guest user

    can :read, Entry
    can :create, Entry do |entry|
      THREAD_STARTERS.empty? ? !user.new_record? : THREAD_STARTERS.include?( user.username )
    end
  end
end
