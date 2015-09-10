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

    render :json => oembed_hash(@product)
  end
  
  private
  
  def oembed_hash(product)
    {
      :provider_name => current_store.name,
      :url => product_url(product, :host => current_store.url),
      :title => product.name,
      :description => product.description,
      :product_id => product.master.sku,
      :price => product.price,
      :currency_code => current_store.default_currency,
      :availability => product.master.stock_items.sum(:count_on_hand) > 0 ? 'in stock' : 'out of stock',
      :brand => product.property(:brand)
    }
  end

end