require 'webrick'

class MyServlet < WEBrick::HTTPServlet::AbstractServlet
  def do_GET (request, response)
  	if request.query["str"]
      words = request.query["str"]
		  response.body = words.downcase + " | Current Pod: " + ENV['HOSTNAME']
	  else
		  response.body = "A string parameter is required"
  	end
  end
end

server = WEBrick::HTTPServer.new(:Port => 80)
server.mount "/", MyServlet
trap "INT" do server.shutdown end
server.start