#more on configuration on http://juanitofatas.com/2015/05/19/rubygem-configuration-pattern/

module AnnouncementPlan
  def self.configuration
    @configuration ||= Configuration.new
  end

  def self.configuration=(configuration)
    @configuration = configuration
  end

  def self.configure
    yield configuration
  end

  class Configuration
    attr_accessor :with_tenant, :with_role, :role_omschr

    def initialize
      @with_tenant = true
      @with_role   = true
      @role_omschr    = ["superuser", "admin", "gebruiker", "gast", "medewerker", "manager", "accountant"]
      # @current_user = 
     
      # @class_name = "emoji".freeze
      # @img_attrs  = {}
    end
  end
end