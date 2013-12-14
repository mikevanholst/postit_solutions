class CategoriesController < ApplicationController

  before_action :require_user, only: [:new, :create]

  def new
    @category = Category.new
  end

  def show  
    @category = Category.find(params[:id])

  end
  
  def create
    @category = Category.new(category_params)
    @category.name =@category.name.downcase.capitalize!
    if @category.save
      flash[:notice]  = "New category created!"
      redirect_to new_category_path
    else
      render 'categories/new'
    end
  end


  private

  def category_params
    params.require(:category).permit(:id, :name)
  end



end