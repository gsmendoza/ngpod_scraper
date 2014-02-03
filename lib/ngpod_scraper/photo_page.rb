module NgpodScraper
  class PhotoPage
    attr_reader :config, :url

    def initialize(url, config = {})
      @url = url
      @config = config
    end

    def photo
      url = photo_url
      attributes = (config[:photo] || {}).merge(:url => url, :file => open(photo_url))
      return Photo.new(attributes)
    end

    def photo_url
      page = Nokogiri::HTML(open(url))
      begin
        "http:#{page.search(".primary_photo img").attr('src').value}"
      rescue Exception => e
        raise MissingPhotoUrl, "Cannot find the photo url: #{e.message}"
      end
    end
  end
end
