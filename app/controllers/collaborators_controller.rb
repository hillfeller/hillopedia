class CollaboratorsController < ApplicationController
  before_action :set_wiki

  def index
    @users = User.all
  end

  def create
    @collaborator = @wiki.collaborators.new(user_id: params[:user_id])

    if @collaborator.save
      flash[:notice] = "Collaborator has been added."
    else
      flash[:error] = "Collaborator failed to add."
    end

    redirect_to wiki_collaborators_path(@wiki)
  end

  def destroy
    @collaborator = @wiki.collaborators.find(params[:id])

    if @collaborator.destroy
      flash[:notice] = "Collaborator has been removed."
    else
      flash[:error] = "Collaborator failed to remove."
    end
      redirect_to wiki_collaborators_path(@wiki)
  end

  private

  def set_wiki
      @wiki = Wiki.find(params[:wiki_id])
  end

end
