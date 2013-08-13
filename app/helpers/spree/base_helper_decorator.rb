module Spree
  BaseHelper.module_eval do
    def pin_it_button(product)

      url = escape product.url
      media = escape product_image_url(product)
      description = escape product.name

      link_to('Pin It',
              "http://pinterest.com/pin/create/button/?url=#{url}&media=#{media}&description=#{description}",
              class: 'pin-it-button',
              'count-layout' => 'none').html_safe
    end

    def absolute_image_url(url)
      return url if url.starts_with? 'http'
      request.protocol + request.host + url
    end

    def escape(string)
      URI.escape string, /[^#{URI::PATTERN::UNRESERVED}]/
    end

    define_method "product_image_url" do |product, *options|
      options = options.first || {}
      if product.imagesize >= 300
        'http://static1.ziggos.com/products/' + product.vendorcode + '/300/' + product.sku[0] + '/' + product.sku + '.jpg'
      elsif product.imagesize > 100
        'http://static1.ziggos.com/products/' + product.vendorcode + '/x/' + product.sku[0] + '/' + product.sku + '.jpg'
      else
        nil
      end
    end

  end
end
