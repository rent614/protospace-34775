class PrototypesController < ApplicationController
  before_action :move_to_index, except: [:index, :show]
  
  def index
    @prototypes = Prototype.all
  end

  def new
    @prototype = Prototype.new
   
  end

  def create
     @prototype = Prototype.new(prototype_params)
    if @prototype.save
      redirect_to root_path(@prototype)
    else
      render :new
    end
  end

  def show
    @prototype = Prototype.find(params[:id])
    @comment = Comment.new
    @comments = @prototype.comments.includes(:user)
    
    
  end 

  def move_to_index
  end

  def edit
    @prototype = Prototype.find(params[:id])
  end

  def update
    prototype = Prototype.find(params[:id])
    if prototype.update(prototype_params)
      redirect_to  prototype_path
    else
      render  edit_prototype_path
    end
  end
  
  def destroy
    prototype = Prototype.destroy(params[:id])
    redirect_to root_path
  end

  private
  def prototype_params
    params.require(:prototype).permit(:title, :catch_copy, :concept, :image).merge(user_id:current_user.id)
  end
end
