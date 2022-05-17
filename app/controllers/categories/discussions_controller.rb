# frozen_string_literal: true

class Categories::DiscussionsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_category

  def index
    @discussions = @category.discussions.order(updated_at: :desc)

    render "discussions/index"
  end

private

  def set_category
    @category = Category.find(params[:id])
  end
end
