class ArticlesController <ApplicationController

def show
    #byebug
  @article=Article.find(params[:id])
end

def index
  @articles = Article.paginate(page: params[:page], per_page: 5)
end

def new
@article= Article.new
end

def edit
    @article = Article.find(params[:id])
end

def create
    #render plain: params[:article]
    @article= Article.new(params.require(:article).permit(:title, :description))
    @article.blogger=current_blogger
    #render plain: @article
    #render plain: @article.inspect
    if @article.save   #redirect_to article_path(@article)
    redirect_to @article   
    else
    render 'new'
    end
end

def update
    @article = Article.find(params[:id])
    if @article.update(params.require(:article).permit(:title, :description))
      #flash[:notice] = "Article was updated successfully."
      redirect_to @article
    else
      render 'edit'
    end
end

def destroy
  @article = Article.find(params[:id])
  @article.destroy
  redirect_to articles_path 
end
end
