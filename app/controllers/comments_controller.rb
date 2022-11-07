class CommentsController < ApplicationController
  
  def index
  end

  def new
    # @my_thread = MyThread.find(params[:my_thread_id])
    @comment = Comment.new
  end

  def create
    @my_thread = MyThread.find(params[:my_thread_id])
    @comment = @my_thread.comments.new(comment_params)
    if @comment.save
      redirect_to my_thread_path(@my_thread)
    else
      render :new
    end
  end

  def edit
    @my_thread = MyThread.find(params[:my_thread_id])
    @comment = @my_thread.comments.find(params[:id])
  end

  def update
    @comment = Comment.find(params[:id])
    if @comment.update(comment_params)
      redirect_to my_thread_path(@comment.my_thread)
    else
      render :edit
    end
  end

  def destroy
    @my_thread = MyThread.find(params[:my_thread_id])
    @comment = @my_thread.comments.find(params[:id])
    @comment.destroy
    redirect_to my_thread_path
  end


  private
  def comment_params
    params.require(:comment).permit(:text)
  end

end
