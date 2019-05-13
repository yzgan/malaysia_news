namespace :schedule do
  desc "Delete aging articles searches and resources"
  task delete_aging: :environment do
    Rails.logger.info 'Initiate clean up'
    Article.cleanup 15.days
    Search.cleanup  15.days
    Resource.cleanup 15.days
    Rails.logger.info 'Clean up successfully'
  end
end
