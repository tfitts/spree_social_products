Spree::ProductsController.class_eval do

  helper 'spree/products'

  def oEmbed
    matches = params[:url].scan(/https?:\/\/(.*)?\/products\/(.*)/)
    if matches.first.nil?
      render :json => {:status => "Invalid URL"}, :status => 404
      return
    end
    id = matches.first.last
    @product = Spree::Product.find_by_slug(id)

    render :json => @product.oEmbed
  end

end