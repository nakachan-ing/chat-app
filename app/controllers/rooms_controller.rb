class RoomsController < ApplicationController

  def index
  end

  def new
    @room = Room.new
  end

  def create
    #アクション内で、保存できた場合とできなかった場合で条件分岐のため、newアクションから記述している
    @room = Room.new(room_params)
    if @room.save
      redirect_to root_path
    else
      render :new
    end
  end

  def destroy
    room = Room.find(params[:id])
    room.destroy
    redirect_to root_path
  end

  private
  def room_params
    params.require(:room).permit(:name, user_ids: [])
  end

end
