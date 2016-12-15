this_dir = File.expand_path('../', File.dirname(__FILE__))
lib_dir = File.join(this_dir, 'lib/services')
$LOAD_PATH.unshift(lib_dir) unless $LOAD_PATH.include?(lib_dir)

require 'grpc'
require 'rpc_services_pb'
require 'webrick'

server = WEBrick::HTTPServer.new(:Port => 8082)

class MyServlet < WEBrick::HTTPServlet::AbstractServlet
  def do_GET (request, response)
    service_path = request.path.gsub("/", "")
    words = request.query["str"]

    if service_path.empty?
      response.body = "Available endpoints are: 'lowercase', 'reverse', 'titlecase', 'uppercase' "
    else
      case service_path
        when "lowercase"
            response.body = main(service_path, words)
        when "reverse"
          response.body = main(service_path, words)
        when "titlecase"
          response.body = main(service_path, words)
        when "uppercase"
          response.body = main(service_path, words)
        else
          response.body = "This endpoint is not available, please try another endpoint"
      end
    end
  end
end

def main(service_path, words)
  stub = WordTransformer::Micro::Stub.new('localhost:50009', :this_channel_is_insecure)
  endpoint = service_path.gsub("case", "_case")
  message = stub.send(endpoint, WordTransformer::Word.new(word: words.to_s)).result
  "Your word has been converted to #{service_path}: #{message}"
end

server.mount "/", MyServlet
trap "INT" do server.shutdown end
server.start