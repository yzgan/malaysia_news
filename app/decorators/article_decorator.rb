class ArticleDecorator < Draper::Decorator
  include Draper::LazyHelpers

  delegate_all

  def recent_badge
    return unless recent?
    content_tag :span, nil, class: 'new badge btn-floating pulse'
  end

  def created_at
    object.created_at.strftime("%A, %B %e at %I:%M%p")
  end
end
