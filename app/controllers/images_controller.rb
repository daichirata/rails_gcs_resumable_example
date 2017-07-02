require "net/https"

class ImagesController < ApplicationController
  def index
  end

  def resumable_url
    storage = Google::Cloud.storage
    bucket = storage.bucket(ENV["GCS_BUCKET"])
    signed_url = bucket.signed_url(
      params["filename"],
      method: "POST",
      content_type: params["content_type"],
      expires: 300,
      headers: {"x-goog-resumable" => "start"}
    )

    response = send_post(signed_url, params["content_type"])

    render json: { url: response['Location'] }
  end

  private

  def send_post(url, content_type)
    u = URI.parse(url)
    http = Net::HTTP.new(u.host, u.port)
    http.use_ssl = true
    http.set_debug_output($stdout)
    request = Net::HTTP::Post.new(u.request_uri)
    request["Content-Type"] = content_type
    request["Content-Length"] = 0
    request["x-goog-resumable"] = "start"
    return http.request(request)
  end
end
