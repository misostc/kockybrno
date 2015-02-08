module ArticlesHelper
  def article_short(article, length = 130)
    @article = article
    @length = length
    render partial: 'articles/article_short'
  end
end
