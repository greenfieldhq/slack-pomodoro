namespace :pomodoro do
  desc "Start the Pomodoro Slack bot"
  task :start => :environment do
    puts "Starting Pomodoro"
    PomodoroWorker.perform_async []
  end
end
