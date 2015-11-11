class WikiPolicy < ApplicationPolicy
  attr_reader :user, :wiki

  def update?
    user.admin? or not wiki.published?
  end
end
