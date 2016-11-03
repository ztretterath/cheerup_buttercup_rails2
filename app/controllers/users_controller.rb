class UsersController < ApplicationController
  def index
    users = User.all
    # cheerups = CheerUp.all
    render json: users
  end

  # GET /users/1
  def show
    user = User.find(params[:id])
    render json: user
  end

  #POST/users
  def create
    user = User.new(user_params)
    if user.save
      render json: user, status: :created
    else
      render json: user.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /users/1
  def update
    user = User.find(params[:id])
    if user.update(user_params)
      render json: user
    else
      render json: user.errors, status: :unprocessable_entity
    end
  end

  # DELETE /users/1
  def destroy
    user = User.find(params[:id])
    user.destroy

    render json: {status: 204}
  end

  def cheer_ups
    cheerups = CheerUp.all
    render json: cheerups
  end

  def add_cheer_up
    user = User.includes(:cheer_ups).find(params[:id])
    cheer_up = Song.find(params[:cheer_up_id])

    render json:{
      status: 200,
      user: user,
      cheer_up: user.cheer_ups
    }
  end

  def remove_cheer_up
    user = User.includes(:cheer_up).find(params[:id])
    cheer_up = CheerUp.find(params[:cheer_up_id])
    user.remove_cheer_up(cheer_up)

    render json: {
      status: 204,
      user: user,
      cheer_ups: user.cheer_ups
    }
  end


  private

    def user_params
      params.require(:user).permit(:last_name, :first_name, :username, :password, :email)
    end
end
