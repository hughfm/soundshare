class AuthorizationPolicy < ApplicationPolicy
  def destroy?
    record.sound.owned_by?(user)
  end
end
