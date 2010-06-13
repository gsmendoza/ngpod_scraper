module NgpodScraper
  class Client
    attr_reader :config

    def initialize(config)
      @config = config
    end

    def get_photo
      PhotoPage.new(config[:url], config).photo
    end

    def log(message)
      if config[:show_logs]
        puts message
      end
    end

    def run
      photo = get_photo
      if photo.exists?
        log "Wasn't able to download the photo of the day. Maybe the photo has already been downloaded."
      else
        photo.save
        log "Downloaded #{photo.path}"
      end
      photo
    end
  end
end
