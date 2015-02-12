class NewFacesController < ApplicationController
  def new
    @team_id = params[:standup_id]
  end

  def create
    Board.create_new_face(
      observer: self,
      new_face_repo: new_face_repo,
      team_id: params[:standup_id],
      attributes: params[:new_face],
    ).execute
  end

  def new_face_created(new_face)
    redirect_to standup_path(params[:standup_id])
  end
end
