class BloggersController < ApplicationController
    before_action :require_blogger, only: [ :show,:edit, :update]
    before_action :require_same_user, only: [:edit, :update]
    
    def index
        @bloggers= Blogger.paginate(page: params[:page], per_page: 5)
    end

    def show
        @blogger=Blogger.find(params[:id])
        @articles=@blogger.articles.paginate(page: params[:page], per_page: 5)
    end

    def edit
        @blogger=Blogger.find(params[:id])
    end
    
    def require_same_blogger
        if current_blogger != @blogger && !current_useradmin?
          flash[:alert] = "You can only edit or delete your own account"
          redirect_to @blogger
        end
    end
end