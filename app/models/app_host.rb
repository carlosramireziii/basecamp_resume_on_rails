class AppHost
  class << self
    def domain
      ENV.fetch("DOMAIN") { "localhost" }
    end

    def port
      ENV.fetch("WEB_PORT") { "3000" }
    end

    def domain_with_port
      [domain, port].compact.join(":")
    end

    def protocol
      use_ssl? ? "https" : "http"
    end

    def use_ssl?
      ENV.fetch("USE_SSL") { false }
    end
  end
end
