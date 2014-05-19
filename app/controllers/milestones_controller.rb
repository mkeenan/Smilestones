class MilestonesController < ApplicationController


def new
  @milestone = Milestone.new
  @child = Child.find(params[:child_id])
  @type = ["Choose a Milestone", "first steps", "first birthday", "first day of school", "wedding"]
end

def create
  @child = Child.find(params[:child_id])
  @milestone = @child.milestones.new(params.require(:milestone).permit(:date, :notes, :name, :custom, :picture))
  if @milestone.save
    flash[:success] = "You updated your milestones!"
    redirect_to child_path(@child)
  else
    render 'new'
  end
end


def show
  # @milestone = Milestone.find(params[:id])
end

def edit
  child = Child.find(params[:child_id])
  @milestone = child.milestones.find(params[:id])
end

def destroy
  child = Child.find(params[:child_id])
  @milestone = child.milestones.find(params[:id])
  if @milestone.destroy
    flash[:success] = "Milestone deleted."
    redirect_to child_path(child)
  else
    render 'new'
  end
end

end
