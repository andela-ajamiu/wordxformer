require 'webrick'

server = WEBrick::HTTPServer.new(:Port => 80)

class MyServlet < WEBrick::HTTPServlet::AbstractServlet
  def do_GET (request, response)
    if request.query["str"]
      words = request.query["str"]
      response.body = words.upcase + " | " + ENV['HOSTNAME']
    else
      response.body = "A string parameter is required"
    end
  end
end

server.mount "/", MyServlet

trap "INT" do server.shutdown end

server.start