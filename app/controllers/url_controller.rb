require 'securerandom'
require 'open-uri'
require 'nokogiri'

class UrlController < ApplicationController

    def create
        @url = Url.new(url_params)
        @url.short_url = generate_short_url()
        @url.title_tag = generate_title_tag(@url.target_url)
        puts @url.inspect 
        
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
            @url.increment!(:clicks)
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

            return "#{request.protocol}#{request.host_with_port}/#{short_url}"
        end

        def generate_title_tag(url)
            html = URI.open(url)
            doc = Nokogiri::HTML(html)
            title_node_set = doc.css('title')
            title_tag = title_node_set.empty? ? "Untitled page" : title_node_set.text
        end

        def url_params
            params.permit(:target_url).permit(:target_url)
        end

end
