module Charm
  class SessionsController < ApplicationController
    include PreviousLocation

    before_action :ensure_signed_in, only: %w[destroy]

    before_action -> { @errors = [] }, only: %w[new create]

    def new
    end

    def create
      user = Account.find_by_email(params[:email])

      if user.try(:authenticate, params[:password])
        self.current_user = user
        redirect_to_previous_location root_path, flash: { success: t('session.created') }
      else
        @errors << t('session.unable_to_create')
        render :new
      end
    end

    def destroy
      self.current_user = nil
      redirect_to root_path, flash: { success: t('session.destroyed') }
    end
  end
end
