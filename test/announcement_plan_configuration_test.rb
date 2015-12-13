require 'test_helper'
class AnnouncementPlanConfigurationTest <  ActiveSupport::TestCase

  def teardown
    AnnouncementPlan.configuration = nil
    AnnouncementPlan.configure {}
  end

  def test_configuration_defaults
    assert_equal true, AnnouncementPlan.configuration.with_tenant
  end


  def test_configuration_no_value_no_default

    assert_equal ["superuser", "admin", "gebruiker", "gast", "medewerker", "manager", "accountant"], AnnouncementPlan.configuration.role_omschr
  end

  def test_configuration_set_value_no_default
    AnnouncementPlan.configure do |config|
      config.role_omschr = ["admin", "gebruiker"]
    end

    assert_equal ["admin", "gebruiker"] , AnnouncementPlan.configuration.role_omschr
  end

end