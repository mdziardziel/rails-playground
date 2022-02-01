module Middlewares
  class Trailer
    def initialize(app)
      @app = app
    end

    def call(env)
      status, headers, body = @app.call(env)
      headers.merge!('Trailer' => 'Expires')
      def body.trailers
        { 'Expires' => Time.now.to_s }
      end

      [status, headers, body]
    end
  end
end
