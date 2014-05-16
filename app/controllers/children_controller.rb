class ChildrenController < ApplicationController

  before_action :authenticate_user

  def index
    @children = current_user.children.all
  end

  def show
    @child = Child.find(params[:id])
    @milestones = @child.milestones
  end

  def new
    @child = current_user.children.build
  end

  def create
    @child = Child.new(params.require(:child).permit(:name, :birth_date, :user_id, :milestones =>[]))
    # @milestone = Milestone.new(params.require(:milestone).permit(:name))
    if @child.save
        flash[:success] = "Success! You added another child."
        redirect_to :back
      else
        render 'new'
    end
  end


  def edit
    @child = Child.find(params[:id])
  end

  def update
    if @child.update(params.require(:child).permit(:name, :birth_date, :user_id, :milestones =>[]))
      redirect_to child_path
    else
      render 'edit'
    end
  end

  def destroy
    @child = Child.find(params[:id])
    if @child.destroy
        flash[:success] = "Your child has been grounded from the site."
        redirect_to children_path
      else
        render 'new'
      end
    end

end