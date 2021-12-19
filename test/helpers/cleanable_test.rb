module CleanableTest
  extend ActiveSupport::Concern

  included do
    setup do
      Timecop.freeze(1.year.ago) do
        @old_objects = create_list(described_class.to_s.underscore.to_sym, 5)
      end
    end
  end

  def test_includes_cleanable_module
    _(described_class).must_include Cleanable
  end

  def test_cleanup
    assert_equal 5, described_class.aging(1.year.ago).count
    assert_equal @old_objects.pluck(:id).sort, described_class.aging(1.year.ago).pluck(:id).sort
    assert_equal @old_objects.sort, described_class.cleanup.sort
    assert_equal 0, described_class.aging(1.year.ago).count
  end
end
