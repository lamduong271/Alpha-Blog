class ArticlesController < ApplicationController
    # perfom action before any method here, this action takes place in below methods, it run the action before these method do anything else
    before_action :set_article, only: [:edit, :update, :show, :destory]

    def show
        @article = Article.find(params[:id])
        # @ is an instant variable
    end

    def index
        @allArticles = Article.all()
    end

    def new
        @article = Article.new
    end

    def edit
        @article = Article.find(params[:id])
    end

    def create
        # render plain: params[:article]
        @article = Article.new(article_param)
        if @article.save
            flash[:notice] = "article was created"
            redirect_to article_path(@article)
        else
            render :new, status: :unprocessable_entity
        end

    end


    def update
        @article = Article.find(params[:id])
        if @article.update(article_param)
            flash[:notice] = "Article was updated successfully"
            redirect_to article_path(@article)
        else
            render :edit
        end
    end

    def destroy
        @article = Article.find(params[:id])
        @article.destroy
        redirect_to articles_path
    end

    private

    def set_article
        @article = Article.find(params[:id])
    end
    
    def article_param
        params.require(:article).permit(:title, :description)
    end
end