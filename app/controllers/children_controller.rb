class ChildrenController < ApplicationController

  before_action :authenticate_user

  def index
    @children = current_user.children
  end

  def show
  end

  def new
    @child = Child.new

  end

  def create
    @child = Child.new(params.require(:child).permit(:name, :birth_date))
    if @child.save
      flash[:success] = "Success! You added another child."
      redirect_to :back
    else
      render 'new'
    end
  end


  def edit
    @child = current_user.child
    @child.save
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