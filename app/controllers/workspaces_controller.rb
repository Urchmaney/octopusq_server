class WorkspacesController < ApplicationController
  before_action :set_workspace, only: %i[ show update destroy ]

  # GET /workspaces
  def index
    render json: Current.user.workspaces
  end

  # GET /workspaces/1
  def show
    render json: @workspace
  end

  # POST /workspaces
  def create
    @workspace = Workspace.new(workspace_params.merge(user: Current.user))

    if @workspace.save
      render json: @workspace, status: :created, location: @workspace
    else
      render json: @workspace.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /workspaces/1
  def update
    if @workspace.update(workspace_params)
      render json: @workspace
    else
      render json: @workspace.errors, status: :unprocessable_entity
    end
  end

  # DELETE /workspaces/1
  def destroy
    @workspace.destroy!
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_workspace
      @workspace = Workspace.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def workspace_params
      params.expect(workspace: [ :name, :question ])
    end
end
