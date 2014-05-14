class ChildrenController < ApplicationController

  def index
    @children = current_user.children
  end

  def new
    @child = Child.new
  end

  def create
    @child = Child.new(child_params)
    @child.user = current_user
    @child.save
    redirect_to :children
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end

  def child_params

  end
end