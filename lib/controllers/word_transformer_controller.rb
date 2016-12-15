$app_root = File.expand_path('../../../', __FILE__)
lib_dir = File.join($app_root, 'lib/services')
$LOAD_PATH.push(lib_dir) unless $LOAD_PATH.include?(lib_dir)

# require 'pry'; binding.pry

require 'rpc_pb'
require 'rpc_services_pb'

class WordTransformerServer < WordTransformer::Micro::Service
  def lower_case(request_query, _unused_call)
    WordTransformer::Result.new(
      result: request_query.word.downcase
    )
  rescue StandardError => e
    default_error(e)
  end

  def reverse(request_query, _unused_call)
    WordTransformer::Result.new(
      result: request_query.word.reverse
    )
  rescue StandardError => e
    default_error(e)
  end

  def title_case(request_query, _unused_call)
    WordTransformer::Result.new(
      result: request_query.word.split.map { |word| word.capitalize }.join(" ")
    )
  end

  def upper_case(request_query, _unused_call)
    WordTransformer::Result.new(
      result: request_query.word.upcase
    )
  end
end