class CommentsController < ApplicationController
  before_action :authenticate_user
  before_action :set_comment, only: [:show, :edit, :update, :destroy]
  before_action :check_comment_owner, only: [:edit, :update, :destroy]


  # GET /comments/new
  def new
    @playlist = Playlist.find(params[:playlist_id])
    @comment = @playlist.comments.build
  end

  # GET /comments/1/edit
  def edit
  end

  # POST /comments
  # POST /comments.json
  def create
    @playlist = Playlist.find(params[:playlist_id])
    @comment = @playlist.comments.build(comment_params)

    respond_to do |format|
      if @comment.save
        format.html { redirect_to playlist_path(@playlist), notice: 'Comment was successfully created.' }
        format.json { render :show, status: :created, location: @comment }
      else
        format.html { render :new }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /comments/1
  # PATCH/PUT /comments/1.json
  def update
    respond_to do |format|
      if @comment.update(comment_params)
        format.html { redirect_to playlist_path(@comment.playlist), notice: 'Comment was successfully updated.' }
        format.json { render :show, status: :ok, location: @comment }
      else
        format.html { render :edit }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /comments/1
  # DELETE /comments/1.json
  def destroy
    @comment.destroy
    respond_to do |format|
      format.html { redirect_to playlists_path, notice: 'Comment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comment
      @comment = Comment.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def comment_params
      params.require(:comment).permit(:content, :playlist_id, :user_id)
    end

    def check_comment_owner
      redirect_to playlist_path(@comment.playlist) unless @comment.user == current_user
    end
end
