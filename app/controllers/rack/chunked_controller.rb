class Rack::ChunkedController < ApplicationController
  include ActionController::Live

  def stream
    response.set_header('Trailer', 'Expires')

    3.times {
      response.stream.write "hello world\n"
      sleep 0.1
    }
  ensure
    response.stream.close
  end
end
