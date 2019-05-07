namespace :schedule do
  desc "Delete aging articles searches and resources"
  task delete_aging: :environment do
    Rails.logger.info 'Initiate clean up'
    Article.cleanup
    Search.cleanup
    Resource.cleanup
    Rails.logger.info 'Clean up successfully'
  end
end
