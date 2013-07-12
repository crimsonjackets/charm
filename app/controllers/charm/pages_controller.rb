module Charm
  class PagesController < ApplicationController
    before_action :ensure_signed_in_as_admin, only: %w[index new create edit update destroy]

    before_action -> {
      @page = Page.where(params[:path].nil? ? { id: params[:id] } : { path: "/#{params[:path]}" })
      @page = @page.where(published: true).where('"pages"."published_at" <= ?', Time.now) unless signed_in_as_admin?
      @page = @page.first!
    }, only: %w[show edit update destroy]

    def index
      @pages = Page.all
    end

    def show
    end

    def new
      @page = Page.new
    end

    def edit
    end

    def create
      @page = Page.new(page_params)

      respond_to do |format|
        if @page.save
          format.html { redirect_to @page, flash: { success: t('page.created') } }
          format.json { render :show, status: :created, location: @page }
        else
          format.html { render :new }
          format.json { render json: @page.errors, status: :unprocessable_entity }
        end
      end
    end

    def update
      respond_to do |format|
        if @page.update(page_params)
          format.html { redirect_to @page, flash: { success: t('page.updated') } }
          format.json { head :no_content }
        else
          format.html { render :edit }
          format.json { render json: @page.errors, status: :unprocessable_entity }
        end
      end
    end

    def destroy
      @page.destroy

      respond_to do |format|
        format.html { redirect_to pages_path }
        format.json { head :no_content }
      end
    end
  private
    def page_params
      params.require(:page).permit(:path, :published, :published_at, :template, :heading, :body)
    end
  end
end
