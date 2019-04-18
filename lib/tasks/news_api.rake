namespace :newsapi do
  desc "Import external article data from News API source"
  task import: :environment do
    data = NewsApiServices.new.top_headlines
    ImportFromExternal.run!(type: :top_headlines, data: data.with_indifferent_access)
  end
end
