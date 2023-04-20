require 'securerandom'
require 'open-uri'
require 'nokogiri'

class ShortUrlsController < ApplicationController

    def create
        @short_url = ShortUrl.new(short_url_params)

        if @short_url.validate(:target_url)
            @short_url.short_code = generate_short_code
            
            title_tag = generate_title_tag(@short_url.target_url)
            if title_tag.present?
                @short_url.title_tag = title_tag
            end

            @short_url.save
            redirect_to short_url_path(@short_url.short_code)
        else
            render "pages/index", status: :unprocessable_entity
        end
    end

    def new
        @short_url = ShortUrl.new
    end

    def show
        @short_url = ShortUrl.find_by(short_code: params[:short_code])
        if !@short_url.present?
            render_404
        end
    end     

    def statistic
        @short_url = ShortUrl.find_by(short_code: params[:short_code])
        if !@short_url.present?
            render_404
        end
    end
    
    def redirect
        begin
            @short_url = ShortUrl.find_by(short_code: params[:short_code])
            @short_url.increment(:clicks).save
            @short_url.visits.create(originating_geolocation: generate_originating_geolocation)
            redirect_to @short_url.target_url, allow_other_host: true
        rescue
            render_404
        end
    end

    private      
        def generate_short_code()
            short_code = SecureRandom.hex(3)[0, 15]

            # Check if the short code is already taken
            while ShortUrl.find_by(short_code: short_code).present?
                short_code = SecureRandom.hex(3)[0, 15]
            end

            return short_code
        end

        def generate_title_tag(target_url)
            html = URI.open(target_url)
            doc = Nokogiri::HTML(html)
            title_node_set = doc.css('title')
            return title_node_set.empty? ? nil : title_node_set.text
        end

        def generate_originating_geolocation
            ip_address = request.remote_ip == "127.0.0.1" ? "172.56.21.89" : request.remote_ip
            results = Geocoder.search(ip_address).first
            return "#{results.city}, #{results.country}"
        end   

        def short_url_params
            params.require(:short_url).permit(:target_url, :short_code)
        end

end
