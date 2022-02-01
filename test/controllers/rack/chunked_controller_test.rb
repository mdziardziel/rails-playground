require "test_helper"

class Rack::ChunkedControllerTest < ActionDispatch::IntegrationTest
  test "should get stream" do
    get rack_chunked_stream_url, headers: { 'SERVER_PROTOCOL' => 'HTTP/1.1' }
    assert_response :success
  end

  test "should add trailer to response" do
    get rack_chunked_stream_url, headers: { 'SERVER_PROTOCOL' => 'HTTP/1.1' }
    assert_includes response.parsed_body, "Expires:"
  end

  test "should contain Trailer header" do
    get rack_chunked_stream_url, headers: { 'SERVER_PROTOCOL' => 'HTTP/1.1' }
    assert_includes  response.headers.keys, 'Trailer'
  end
end
