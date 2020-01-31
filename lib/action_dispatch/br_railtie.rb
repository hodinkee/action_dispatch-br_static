module ActionDispatch
  class BrRailtie < Rails::Railtie
    initializer 'br_static.install_middleware' do |app|
      app.middleware.swap ::ActionDispatch::Static, ::ActionDispatch::BrStatic,
                          app.paths['public'].first,
                          index: app.config.public_file_server.index_name,
                          headers: app.config.public_file_server.headers || {}
    end
  end
end
