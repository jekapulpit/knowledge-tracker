class TechnologiesUserPolicy < ApplicationPolicy
  def destroy
    user.admin? || user == record.user
  end
end
