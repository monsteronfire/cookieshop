class CookiePolicy < ApplicationPolicy
  attr_reader :user, :cookie

  def initialize(user, cookie)
    @user = user
    @cookie = cookie
  end

  def create?
    user.admin?
  end

  def update?
    user.admin?
  end

  def destroy?
    user.admin?
  end
end
