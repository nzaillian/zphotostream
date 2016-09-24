# ZPhotostream

ZPhotostream is a simple photo stream for the indie web. It powers my own photo stream ([see it here](http://photostream.zaillian.com)) and I built it to my somewhat narrow needs but figure someone else may want to use it. The features that make it great for my needs are:

  * Seamlessly integrates FTP to push your uploads to a media server (I run one dedicated performance/app server for all my projects, and a secondary, more sluggish media server with lots of disk space so this is great for me).

  * Bulk image uploading and drag-and-drop photo arrangement in admin.

  * Pretty fast - everything at the page/partial level is cached thoughtfully.

  * Pretty simple - there's next to no javascript, save for the admin image upload UI.

I'd like to keep this project pretty minimal but if you have contributions to make that are aligned with the virtues listed above please fork and submit a pull request.  

# Setup/Development

This really couldn't be a much more minimal or idiomatic Rails app. There is no job queue or similar external dependency to note. You can set it up for development with a simple `bin/rake db:create && bin/rake db:migrate` and run it with `bin/rails server`.

For production you will want to have a look at the carrierwave.rb initializer and set the environment variables referenced there (you may end up dropping some of the options if they aren't necessary for your setup). You will also probably want to set memcached or redis as your app cache store.