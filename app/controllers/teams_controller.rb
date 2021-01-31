class TeamsController < ApplicationController
  before_action :set_team, only: %i[ show edit update destroy kick ]

  def index
    @teams = Team.all
  end

  def show
    @users = @team.users
    @requests = @team.requests
  end

  def new
    if !current_user.first_name.present?
      redirect_to edit_user_url(current_user), notice: "Please update your account information first" and return
    end

    @team = Team.new
  end

  def edit
    if !@team.leader
      redirect_to @team
    end
  end

  def create
    @team = Team.new(team_params)
    @team.lead = current_user.id
    respond_to do |format|
      if @team.save
        format.html { redirect_to @team, notice: "Team was successfully created." }
        format.json { render :show, status: :created, location: @team }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @team.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @team.update(team_params)
        format.html { redirect_to @team, notice: "Team was successfully updated." }
        format.json { render :show, status: :ok, location: @team }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @team.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @team.destroy
    respond_to do |format|
      format.html { redirect_to teams_url, notice: "Team was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def kick
    @team.users.delete(params[:user_id].to_i)
    redirect_to @team, notice: "User kicked"
  end

  private
    def set_team
      @team = Team.find(params[:id])
    end

    def team_params
      params.require(:team).permit(:name, :description)
    end
end
