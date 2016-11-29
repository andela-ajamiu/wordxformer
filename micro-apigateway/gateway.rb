require 'webrick'
require 'net/http'

class MyServlet < WEBrick::HTTPServlet::AbstractServlet
  def do_GET (request, response)
    service_path = request.path.gsub("/", "")
    words = request.query["str"]

    if service_path.empty?
      response.body = "Available endpoints are: 'lowercase', 'reverse', 'titlecase', 'uppercase' "
    else
      case service_path
        when "lowercase"
          address = "http://#{ENV['LOWER_CASE_URL']}"
          redirect_request(address, words, response)
        when "reverse"
          address = "http://#{ENV['REVERSE_URL']}"
          redirect_request(address, words, response)
        when "titlecase"
          address = "http://#{ENV['REVERSE_URL']}"
          redirect_request(address, words, response)
        when "uppercase"
          address = "http://#{ENV['REVERSE_URL']}"
          redirect_request(address, words, response)
        else
          response.body = "This endpoint is not available, please try another endpoint"
      end
    end
  end

  def redirect_request(address, words, response)
    request_url = URI("#{address}" + "/" + "?str=" + "#{words}")
    response.body = Net::HTTP.get(request_url)
  end
end

server = WEBrick::HTTPServer.new(:Port => 80)
server.mount "/", MyServlet
trap "INT" do server.shutdown end
server.start