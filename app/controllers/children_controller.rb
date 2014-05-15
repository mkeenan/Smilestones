class ChildrenController < ApplicationController

  before_action :authenticate_user

  def index
    @children = current_user.children.all
  end

  def show
  end

  def new
    @child = current_user.children.build
  end

  def create
    @child = Child.new(params.require(:child).permit(:name, :birth_date, :user_id))
    if @child.save
      flash[:success] = "Success! You added another child."
      redirect_to :back
    else
      render 'new'
    end
  end


  def edit
    @child = child.find(params[:id])
    redirect_to child_path
  end

  def update
    if @child.update(params.require(:child).permit(:name, :birth_date))
      redirect_to child_path
    else
      render 'edit'
    end
  end

  def destroy
  end

end