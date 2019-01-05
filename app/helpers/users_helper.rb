module UsersHelper
  def create_confirmed_user
    user_params = {
        username: 'confirmed',
        password: '123456',
        email: 'confirmed@mail.ru',
        confirmed_at: '2018-12-31 15:32:10'
    }
    User.create(user_params)
  end
end
