Spree::Variant.class_eval do
  #attr_accessible :sale_price
  before_validation { |record| record.sale_price = 0 if record.sale_price.nil? }

  alias_method :orig_price_in, :price_in
  def price_in(currency)
    return orig_price_in(currency) unless on_sale?.present?
    Spree::Price.new(variant_id: self.id, amount: self.sale_price, currency: currency)
  end

  def on_sale?
    sale_price.present? && sale_price > 0.0
  end

  def sale_perc
    if sale_price > 0.0
      discount = (1 - (self.sale_price / self.price)) * 100
      discount.round
    end
  end

end
