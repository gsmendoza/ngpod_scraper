module NgpodScraper
  class Client
    attr_reader :config

    def initialize(config)
      @config = config
    end

    def run
      photo = PhotoPage.new(:url => config[:url], :config => config).photo
    end
  end
end
