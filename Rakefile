namespace :gen do
  task :protobuf do
    system "grpc_tools_ruby_protoc -I lib/services --ruby_out=lib/services --grpc_out=lib/services lib/services/rpc.proto"
  end
end