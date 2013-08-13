Spree::Product.class_eval do

  include Spree::Core::Engine.routes.url_helpers

  def oEmbed
    {
        :provider_name => Spree::Config.site_name,
        :url => product_url(self, :host => Spree::Config.site_url),
        :title => self.name,
        :description => self.description,
        :product_id => self.master.sku,
        :price => self.price,
        :currency_code => Spree::Config.currency,
        :availability => self.master.stock_items.first.count_on_hand > 0 ? 'in stock' : 'out of stock',
        :brand => self.property(:brand)

    }
  end

  def url
    product_url(self, :host => Spree::Config.site_url)
  end

end

