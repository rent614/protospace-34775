class PrototypesController < ApplicationController
  
  def index
  
  end

  def new
    @prototype = Prototype.new
  end

  def create
    Prototype.create(prototype_params)
    if current_user.create(prototype_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  

  private
  def prototype_params
    params.require(:prototype).permit(:content, :image).merge(user_id: current_user.id)
  end
end
