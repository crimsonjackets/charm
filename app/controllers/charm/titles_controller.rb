module Charm
  class TitlesController < ApplicationController
    before_action :ensure_signed_in_as_admin

    before_action -> {
      @title = Title.find(params[:id])
    }, only: %w[update destroy]

    def create
      @title = Title.new title_params
      render json: (@title.save ? @title : @title.errors)
    end

    def update
      render json: (@title.update(title_params) ? @title : @title.errors)
    end

    def destroy
      @title.destroy
      render nothing: true
    end
  private
    def title_params
      params.require(:title).permit(:path, :value)
    end
  end
end
