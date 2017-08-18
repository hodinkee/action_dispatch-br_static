module ActionDispatch
  class BrRailtie < Rails::Railtie
    initializer 'br_static.install_middleware' do |app|
      app.middleware.swap ::ActionDispatch::Static, ::ActionDispatch::BrStatic,
                          app.paths['public'].first,
                          app.config.static_cache_control
    end
  end
end
