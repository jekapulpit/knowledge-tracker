module UsersSpecHelper
  def create_confirmed_user
    FactoryGirl.create(:user)
  end
end
