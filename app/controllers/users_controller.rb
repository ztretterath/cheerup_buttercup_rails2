class UsersController < ApplicationController
  before_action :authenticate, except: [:login, :create]

  def index
    users = User.all
    # cheerups = CheerUp.all
    render json: users
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

  # User authentication
  def login
    user = User.find_by(username: params[:user][:username])

    if user && user.authenticate(params[:user][:password])
      token = token(user.id, user.username) # Added this
      render json: {status: 201, user: user, token: token}
    else
      render json: {status: 401, message: "unauthorized"}
    end
  end

  # GET /users/1
  def show
    user = User.find(params[:id])
    render json: user
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

  # Add cheerups to user
  def add_cheer_up
    user = User.includes(:cheer_ups).find(params[:id])
    cheer_up = CheerUp.find(params[:cheer_up_id])

    render json:{
      status: 200,
      user: user,
      cheer_up: user.cheer_ups
    }
  end

  # Updates a user's single cheerup
  def update_cheer_up
    cheerup = CheerUp.find(params[:id])

    cheerup.update(cheerup_params)
  
    render json: {status: 200, cheerup: cheerup}
  end


  def destroy
    cheerup = CheerUp.destroy(params[:id])
    render json: {status: 204}
  end


  # Remove cheerups from user
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

    def token(id, username)
      # binding.pry
      JWT.encode(payload(id, username), ENV['JWT_SECRET'], 'HS256')
    end

    def payload(id, username)
      {
        exp: (Time.now + 1.day).to_i, # Expiration date 24 hours from now
        iat: Time.now.to_i,
        iss: ENV['JWT_ISSUER'],
        user: {
          id: id,
          username: username
        }
      }
    end

    def user_params
      params.require(:user).permit(:last_name, :first_name, :username, :password, :email)
    end
end
