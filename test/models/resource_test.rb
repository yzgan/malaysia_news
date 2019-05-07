require 'test_helper'

class ResourceTest < ActiveSupport::TestCase
  include CleanableTest

  setup do
    @resource_build = build :resource
  end

  context 'associations' do
    should have_many(:articles).dependent(:nullify)
  end

  context 'validations' do
    should validate_uniqueness_of :name
  end

  test 'valid article' do
    assert @resource_build.valid?
  end
end
