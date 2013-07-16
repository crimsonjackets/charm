module Charm
  class MetaTagsController < ApplicationController
    before_action :ensure_signed_in_as_admin

    before_action -> {
      @meta_tag = MetaTag.find(params[:id])
    }, only: %w[update destroy]

    def index
      @meta_tags = MetaTag.all
    end

    def create
      @meta_tag = MetaTag.new meta_tag_params
      render json: @meta_tag.save ? @meta_tag : @meta_tag.errors
    end

    def update
      render json: @meta_tag.update(meta_tag_params) ? head(:no_content) : @meta_tag.errors
    end

    def destroy
      @meta_tag.destroy
      render json: head(:no_content)
    end
  private
    def meta_tag_params
      params.require(:meta_tag).permit(:path, :data)
    end
  end
end
