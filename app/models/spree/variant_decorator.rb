Spree::Variant.class_eval do
  # we alias price_in method to show sale_price when present
  alias_method :orig_price_in, :price_in

  def on_sale?
    self.sale_price > 0.0
  end

  def sale_perc
    if self.sale_price > 0.0
      discount = (1 - (self.sale_price / self.price)) * 100
      discount.round
    end
  end

  def price_in(currency)
    return orig_price_in(currency) unless sale_price.present?
    Spree::Price.new(:variant_id => self.id, :amount => self.sale_price, :currency => currency)
  end
  
end
