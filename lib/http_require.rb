require 'open-uri'

module Kernel

  class HttpLoadError < LoadError; end

  @@http_require_base = nil
  def with_http_require_base(base)
    base, @http_require_base = @http_require_base, base
    yield
  ensure
    @http_require_base = base
  end

  def http_require(path)
    uri = path.is_a?(URI) ? path : URI.parse(path)

    content = uri.read

    with_http_require_base(File.dirname(uri.to_s)) do
      eval(content, binding, uri.to_s)
    end

  end

  alias :require_without_http :require
  def require(path)
    uri = URI.parse(path) rescue nil
    return http_require(uri) if uri.is_a?(URI) && (uri.class != URI::Generic)

    require_without_http(path)

  rescue LoadError => e
    if @http_require_base
      path += ".rb" unless path[-3..-1] == ".rb"
      http_require "#{@http_require_base}/#{path}"
    else
      raise e
    end
  end
end
