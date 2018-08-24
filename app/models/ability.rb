class Ability
  include CanCan::Ability

  def initialize(user)
       user ||= User.new # guest user (not logged in)
       if user.has_role? :admin
         can :manage, :all
       else
         can [:new, :create ], Post
         can [:index, :tedit, :calu, :calu_result, :calu_angry, :calu_angry2, :time, :update, :destroy, :edit, :lshow], Post, user_id: user.id
         can [:etc, :etc_cal, :amidakuji, :team], Post
         
         can [:new, :create, :show], Food
         can [:edit, :update, :destroy], Food, user_id: user.id
         
         can [:new, :create, :show], Activity
         can [:edit, :update, :destroy], Activity, user_id: user.id
       end
  end
    #
    # The first argument to `can` is the action you are giving the user
    # permission to do.
    # If you pass :manage it will apply to every action. Other common actions
    # here are :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on.
    # If you pass :all it will apply to every resource. Otherwise pass a Ruby
    # class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the
    # objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, :published => true
    #
    # See the wiki for details:
    # https://github.com/CanCanCommunity/cancancan/wiki/Defining-Abilities

end
