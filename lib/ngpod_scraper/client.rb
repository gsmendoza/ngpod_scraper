module NgpodScraper
  class Client
    attr_reader :config
    def initialize(config)
      @config = config
    end
  end
end
