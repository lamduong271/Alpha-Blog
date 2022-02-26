class ArticlesController < ApplicationController
    def show
        @article = Article.find(params[:id])
        # @ is an instant variable
    end

    def index
        @allArticles = Article.all()
    end
end