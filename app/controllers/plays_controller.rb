class PlaysController < ApplicationController
  def index
    @plays = Play.last(3)
  end

  def new
    @play = Play.new
  end

  def create
    @play = Play.new(play_params)
    if @play.save
      redirect_to plays_path
    else
      flash[:errors] = "blank"
      render :new
    end
  end

  def destroy
    Play.destroy(params[:id])
    redirect_to plays_path
  end

  def play_params
    params.require(:play).permit(:word)
  end
end
