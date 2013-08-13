Spree::ProductsController.class_eval do

  helper 'spree/products'

  def oEmbed
    id = params[:url].scan(/https?:\/\/(.*)?\/products\/(.*)/).first.last
    @product = Spree::Product.find_by_permalink!(id)

    render :json => @product.oEmbed
  end

end