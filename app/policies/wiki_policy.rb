class WikiPolicy < ApplicationPolicy
  class Scope
    attr_reader :user, :scope
    def initialize(user, scope)
      @user = user
      @scope = scope
    end

    def resolve
      if user.admin? || user.premium?
        scope.all
      else
        scope.where(public: true)
      end
    end
  end

  def update?
    user.admin? || user.premium? || wiki.public?
  end
end
