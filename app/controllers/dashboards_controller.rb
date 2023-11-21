class DashboardsController < ApplicationController
  def index
    if user_sign_in?
      render :index
    else
        render "shared/flashes", status: :forbidden
    end
  end
end
