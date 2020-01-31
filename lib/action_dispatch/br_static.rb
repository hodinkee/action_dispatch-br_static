# frozen_string_literal: true

require 'action_dispatch/br_railtie' if defined?(Rails)
require 'action_dispatch/middleware/static'

module ActionDispatch
  class BrFileHandler < FileHandler
    def serve(request)
      path        = request.path_info
      brotli_path = brotli_file_path(path)

      return super if !brotli_path || !brotli_encoding_accepted?(request)

      request.path_info = brotli_path
      status, headers, body = @file_server.call(request.env)
      if status == 304
        return [status, headers, body]
      end

      headers["Content-Encoding"] = "br"
      headers["Content-Type"]     = content_type(path)
      headers["Vary"]             = "Accept-Encoding"

      return [status, headers, body]
    ensure
      request.path_info = path
    end

    private

    def brotli_file_path(path)
      brotli_path = "#{path}.br"
      if File.exist?(File.join(@root, ::Rack::Utils.unescape_path(brotli_path).b))
        brotli_path.b
      else
        false
      end
    end

    def brotli_encoding_accepted?(request)
      request.accept_encoding.any? { |enc, quality| enc =~ /\bbr\b/i }
    end
  end

  class BrStatic < Static
    def initialize(app, path, index: "index", headers: {})
      @app = app
      @file_handler = BrFileHandler.new(path, index: index, headers: headers)
    end
  end
end
