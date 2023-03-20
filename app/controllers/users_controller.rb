class UsersController < BaseController
  def index
    @users = User.all
  end
  
  def show
    
  end

  def create
   
  end

  def destroy

  end

  private

  def user_params
    params.require(:user).permit(:id, :name)
  end

end
