require 'test_helper'

class SearchTest < ActiveSupport::TestCase
  include CleanableTest

  setup do
    @search_build = build :search
  end

  should define_enum_for(:status).with(%i[error ok])

  context 'associations' do
    should have_many(:articles).dependent(:nullify)
  end

  test 'valid search' do
    assert @search_build.valid?
  end
end
