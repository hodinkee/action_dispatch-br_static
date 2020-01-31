module ActionDispatch
  class BrRailtie < Rails::Railtie
    initializer 'br_static.install_middleware' do |app|
      app.middleware.swap ::ActionDispatch::Static, ::ActionDispatch::BrStatic,
                          app.paths['public'].first,
                          app.config.public_file_server.index_name,
                          app.config.public_file_server.headers || {}
    end
  end
end
