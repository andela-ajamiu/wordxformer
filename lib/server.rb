require_relative './controllers/word_transformer_controller'

class MainServer
  def self.run
    # require 'pry'; binding.pry
    addr = "0.0.0.0:50009"
    puts "Starting grpc server on #{addr}"

    s = GRPC::RpcServer.new
    s.add_http2_port(addr, :this_port_is_insecure)
    s.handle(WordTransformerServer)
    s.run_till_terminated
  rescue Interrupt => exception
    puts "#{exception.inspect}. Exiting..."
  end
end

MainServer.run