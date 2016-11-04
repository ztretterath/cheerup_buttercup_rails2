class CheerUpsController < ApplicationController
  def index
    cheer_ups = CheerUp.all

    render json: {status: 200, cheer_ups: cheer_ups}
  end

  def show
    cheer_up = CheerUp.find(params[:id])

    render json: {status: 200, cheer_up: cheer_up}
  end

  private
    def cheer_up_params
        params.require(:cheer_up).permit(:title, :content, :category, :user_id)
    end

end
