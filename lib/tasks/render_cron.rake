namespace :render_cron do
  desc "bundle executation for cron job to import article and cleanup"
  task execute: :environment do
    Rake::Task["schedule:delete_aging"].invoke
    Rake::Task["newsapi:import"].invoke
  end
end
