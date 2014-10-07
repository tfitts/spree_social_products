Spree::ProductsController.class_eval do

  helper 'spree/products'

  def oEmbed
    matches = params[:url].scan(/https?:\/\/(.*)?\/products\/(.*)/)
    if matches.first.nil?
      Rails.logger.error("oEmbedError: url: #{params[:url]}\nmatches: #{matches}")
    end
    id = matches.first.last
    @product = Spree::Product.find_by_permalink!(id)

    render :json => @product.oEmbed
  end

end