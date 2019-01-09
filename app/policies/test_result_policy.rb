class TestResultPolicy < ApplicationPolicy
  def destroy
    user.admin? || user == record.user
  end
end
