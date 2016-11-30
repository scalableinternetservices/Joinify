class CommentsController < ApplicationController
  def new
  end

  def index
  end

  def show
  end

  def create
    @event = Event.find_by_id(params[:id])
    @comment = Comment.new(
        :message => params[:comment][:message],
        :creator_id => current_user.id,
        :event_id => @event.id
    )
    @comment.save
    @comments = @event.comments
    redirect_to event_path(@event)
  end

  def destroy
  end

  def update
  end

  def edit
  end
end
