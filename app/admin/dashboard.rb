# rubocop:disable Metrics/BlockLength
ActiveAdmin.register_page "Dashboard" do
  menu priority: 1, label: proc { I18n.t("active_admin.dashboard") }

  content title: proc { I18n.t("active_admin.dashboard") } do
    # Graph and Visualization
    columns do
      column do
        div do
          br
          text_node %{<iframe src="https://rpm.newrelic.com/public/charts/6VooNO2hKWB"
                              width="500" height="300" scrolling="no" frameborder="no">
                      </iframe>}.html_safe
        end
      end
    end

    # Recent list
    columns do
      column do
        panel 'Recent Articles' do
          ul do
            Article.last(5).map do |article|
              li link_to article.title, admin_article_path(article)
            end
          end
        end
      end

      column do
        panel 'Recent Sources' do
          ul do
            Resource.last(5).map do |resource|
              li link_to resource.name, admin_resource_path(resource)
            end
          end
        end
      end

      column do
        panel 'Recent Searches' do
          ul do
            Search.last(5).map do |search|
              li link_to search.created_at, admin_search_path(search)
            end
          end
        end
      end
    end
  end
end
# rubocop:enable Metrics/BlockLength
