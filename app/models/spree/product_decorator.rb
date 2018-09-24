Spree::Product.class_eval do
  delegate :sale_price, to: :master
  # delegate_belongs_to :master, :sale_price
  #attr_accessible :sale_price

  def on_sale?
    self.variants_including_master.inject(false) { |f, v| f || v.on_sale? }
  end

end
