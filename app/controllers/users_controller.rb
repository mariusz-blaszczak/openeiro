class UsersController < ApplicationController
  def register
    user = User.new(uuid: filtered_params[:user_id], registration_id: filtered_params[:registration_id])
    if user.save
      render json: { status: 'success', body: user }, status: 201
    else
      render json: { status: 'failure', body: user.errors.full_messages.join('. ') }, status: 401
    end
  end

  private

  def filtered_params
    params.permit(:user_id, :registration_id)
  end
end