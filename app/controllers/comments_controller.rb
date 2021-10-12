    class CommentsController < ApplicationController
    
    def new
        @comment=Comment.new
    end

    def create
        #byebug
        @comment=Comment.new(comment_params)
        if @comment.save
            flash[:notice]="Comment Successfully Added"
            #redirect_to post_path(@comment.article_id)
            redirect_back fallback_location: @article
        else
            flash.now[:alert]="Fill correct details"
           
        end
    end

    def comment_params
        params.require(:comment).permit(:data,:article_id,:blogger_id)
    end

end
