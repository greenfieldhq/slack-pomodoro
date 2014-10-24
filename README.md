Prequisites
==

1. Redis
1. Rails 4.1

Running Novus
==

`git clone git@github.com:greenfieldhq/slack-pomodoro.git`  
from inside of one terminal window:

    bundle exec sidekiq

from inside another terminal window

    rake pomodoro:start

For the Sidekiq console, open a new terminal window
    
    rails s
    in a browser, navigate to `http://localhost:3000/sidekiq`
