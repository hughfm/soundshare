class SoundPolicy < ApplicationPolicy
  def create?
    user
  end

  def update?
    record.owned_by?(user)
  end

  def destroy?
    record.owned_by?(user)
  end

  def share?
    record.owned_by?(user)
  end

  def show?
    record.public? || record.owned_by?(user) || record.authorized_to?(user)
  end
end
