# rubocop:disable Metrics/BlockLength
ActiveAdmin.register_page "Dashboard" do
  menu priority: 1, label: proc { I18n.t("active_admin.dashboard") }

  content title: proc { I18n.t("active_admin.dashboard") } do
    # Graph and Visualization
    columns do
      column do
        panel 'Article by day' do
          div do
            line_chart Article.group_by_day(:created_at).count
          end
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
