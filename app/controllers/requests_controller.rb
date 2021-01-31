class RequestsController < ApplicationController
  before_action :set_request, only: %i[ destroy accept ]

  def create
    Request.new(team_id: params[:team].to_i, user_id: current_user.id).save
    redirect_to Team.find(params[:team].to_i), notice: "Request made"
  end

  def accept
    @request.team.users << @request.user
    @request.destroy
    redirect_to @request.team, notice: "User accepted"
  end

  def destroy
    @request.destroy
    redirect_to @request.team, notice: "User declined"
  end

  private
    def set_request
      @request = Request.find(params[:id])
    end
end
