class PomodoroWorker
  include Sidekiq::Worker

  def perform(history)
    isBreak = (history.last == 'pomodoro')

    if isBreak
      if (history.count % 8) == 0
        notify "Take a 15 minute break!"
        PomodoroWorker.perform_at(25.minutes.from_now, (history << 'break'))
      else
        notify "Take a 5 minute break!"
        PomodoroWorker.perform_at(5.minutes.from_now, (history << 'break'))
      end
    else
      if history.count == 0
        notify "Start Pomodoroing!! Next break will be in 25 minutes."
      else
        notify "Pomodoro! Next break will be in 25 minutes."
      end
      PomodoroWorker.perform_at(25.minutes.from_now, (history << 'pomodoro'))
    end
  end

  def notify msg
    notifier = Slack::Notifier.new SLACK_WEBHOOK_URL
    notifier.ping msg, icon_emoji: ':tomato:', channel: '#general', username: 'gfield-bot'
  end
end
