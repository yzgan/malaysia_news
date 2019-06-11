module Cleanable
  extend ActiveSupport::Concern

  included do
    scope :aging, ->(limit) { where('created_at <= ?', limit) }
  end

  class_methods do
    # class_name.cleanup would clean article longer than 1 year by default.
    # Possible to specify lifespan limit optionally
    # Article.cleanup 2.year
    def cleanup(lifespan = 1.year)
      raise I18n.t('cleanup.invalid_argument') unless lifespan.is_a? ActiveSupport::Duration

      aging(lifespan.send(:ago)).destroy_all
    end
  end
end
