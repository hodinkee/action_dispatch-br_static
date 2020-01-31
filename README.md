# ActionDispatch::BrStatic

ActionDispatch::BrStatic is a derivative of ActionDispatch::Static, that has
been modified to serve the .br files that are created by the Rails asset
precompiler.

If you are using Rails to serve static assets in production, and
you are using the asset precompiler, then it is probably a good idea to use this
gem. If you are running on Heroku, this includes you.

ActionDispatch::BrStatic is a better solution that using Rack::Deflater on your
static assets, because this has the undesirable side effect of recompressing
assets that are already compressed, such as images. It is still a good idea to
use Rack::Deflater for your app responses, but it should be positioned after
Rack::BrStatic in the middleware stack.

**This fork has been modified to support Rails 5**

## Installation

Add this line to your application's Gemfile:

    group :production do
      gem 'action_dispatch-br_static', github: 'hodinkee/action_dispatch-br_static'
    end

Add this to application.rb:

    # The railtie initializer will look for ActionDispatch::Static, and swap it
    # with ActionDispatch::BrStatic
    config.public_file_server.enabled = true

    # This isn't required, but is generally a good idea.
    config.static_cache_control = "public, max-age=#{1.month.to_i}"

## License

The MIT License (MIT)

Copyright (c) 2017 Bohdan Derevenets

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.
