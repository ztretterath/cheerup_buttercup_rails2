class CheerUpsController < ApplicationController
  def index
    cheerups = CheerUp.all

    render json: {status: 200, cheerups: cheerups}
  end

  def create
    user = User.find_by(username: user_params[:user_username])
    cheerup = CheerUp.new(cheerup_params)

    cheerup.user_id = user.id if user

    if cheerup.save
      render json: {status: 200, cheerup: cheerup}
    else
      render json: {status: 422, cheerup: cheerup}
    end
  end

  def show
    cheerup = CheerUp.find(params[:id])

    render json: {status: 200, cheerup: cheerup}
  end

  private
  def cheerup_params
      params.require(:cheerup).permit(:title, :content, :category, :user_id)
  end

end
