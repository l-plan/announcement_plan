require 'test_helper'
class AnnouncementPlanConfigurationTest <  ActiveSupport::TestCase

  def teardown
    AnnouncementPlan.configuration = nil
    AnnouncementPlan.configure {}
  end

  def test_configuration_defaults
    assert_equal true, AnnouncementPlan.configuration.with_tenant
  end

  def test_set_configuration_another_value
    AnnouncementPlan.configure do |config|
      config.sport = "wielrennen"
    end

    assert_equal "wielrennen", AnnouncementPlan.configuration.sport
  end

  def test_configuration_no_value_no_default

    assert_equal nil, AnnouncementPlan.configuration.role_ref
  end

  def test_configuration_set_value_no_default
    AnnouncementPlan.configure do |config|
      config.role_ref = "naam"
    end

    assert_equal "naam", AnnouncementPlan.configuration.role_ref
  end

end