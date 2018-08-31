require 'net/http'
require 'json'

class SearchController < ApplicationController
  def index

    def get_response_with_redirect(uri)
      r = Net::HTTP.get_response(uri)
      puts r.code
      if r.code == "301"
        @img = r.header['location']
        r = Net::HTTP.get_response(URI.parse(r.header['location']))
      end
      r
    end

    @img_src = Faker::LoremFlickr.image
    uri = URI(@img_src)

    @resp = get_response_with_redirect(uri)

  end
end