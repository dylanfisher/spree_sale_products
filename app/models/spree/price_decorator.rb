Spree::Price.class_eval do
  #alias_method :orig_price_including_vat_for, :price_including_vat_for
  #
  #extend DisplayMoney
  #money_methods :sale_price
  #
  #def sale_price
  #	self.variant.sale_price
  #end
  #
  #def price_including_vat_for(zone)
  #	return orig_price_including_vat_for(zone) unless variant.sale_price.present?
  #  gross_amount(sale_price, zone, variant.tax_category)
  #end
end