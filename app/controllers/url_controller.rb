require 'securerandom'
require 'open-uri'
require 'nokogiri'

class UrlController < ApplicationController

    def create
        @url = Url.new(url_params)
        @url.short_url = generate_short_url
        @url.title_tag = generate_title_tag(@url.target_url)

        if @url.save
            redirect_to "/url/show/#{@url.id}"
        else
            render :new
        end
    end

    def show
        @url = Url.find(params[:id])
    end
    
    def redirect
        @url = Url.find_by(short_url: params[:short_url])
        if @url.present?
            @url.increment(:clicks).save
            @url.visits.create(originating_geolocation: generate_originating_geolocation)
            redirect_to @url.target_url, allow_other_host: true
        else
            render plain: "Short URL not found", status: :not_found
        end
    end

    private      
        def generate_short_url()
            short_url = SecureRandom.hex(5)[0, 15]

            # Check if the short URL is already taken
            while Url.find_by(short_url: short_url).present?
              short_url = SecureRandom.hex(5)[0, 15]
            end

            return short_url
        end

        def generate_title_tag(target_url)
            html = URI.open(target_url)
            doc = Nokogiri::HTML(html)
            title_node_set = doc.css('title')
            return title_node_set.empty? ? "Untitled page" : title_node_set.text
        end

        def generate_originating_geolocation
            ip_address = request.remote_ip == "127.0.0.1" ? "172.56.21.89" : request.remote_ip
            results = Geocoder.search(ip_address).first
            return "#{results.city}, #{results.country}"
        end   

        def url_params
            params.permit(:target_url).permit(:target_url)
        end

end
