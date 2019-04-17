require 'digest'

class UrlsController < ApplicationController
  def show
    url = Url.find_by(slug: params[:slug])

    redirect_to url.original_url
  end

  def create
    respond_to do |format|
      format.json {
        url = Url.create(url_params)

        render json: { url: new_url }.to_json
      }
    end
  end

  private

  def url_params
    params.require(:url).permit(:original_url).merge(slug_param)
  end

  def slug_param
    { slug: slug }
  end

  def slug
    Digest::SHA256.hexdigest(params[:original_url])[0..6]
  end

  def new_url
    "#{request.host_with_port}/#{slug}"
  end
end