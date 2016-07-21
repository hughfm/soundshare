class UserPolicy < ApplicationPolicy
  def update?
    record == user
  end
end
