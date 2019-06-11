class ArticleDecorator < Draper::Decorator
  include Draper::LazyHelpers

  delegate_all

  def recent_badge
    return unless recent?

    content_tag :span, nil, class: 'new badge btn-floating pulse'
  end

  def created_at
    object.created_at.strftime('%A, %B %e at %I:%M%p')
  end

  def url_to_image
    return unless object.valid_image_url?

    object.url_to_image
  end

  def tooltip
    return unless description

    content_tag :p, sanitize(FormatTooltip.run!(tooltip: object.description, html: true)), class: 'left-align'
  end
end
