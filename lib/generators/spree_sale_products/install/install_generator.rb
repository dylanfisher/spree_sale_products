module SpreeSaleProducts
  module Generators
    class InstallGenerator < Rails::Generators::Base
      def add_migrations
        run 'bundle exec rake railties:install:migrations FROM=spree_sale_products'
      end
    end
  end
end
