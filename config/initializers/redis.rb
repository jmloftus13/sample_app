if Rails.env.production?
	#commenting out Redis as it caused issues in ex 6.13 & 6.14
   #$redis = Redis.new(url: ENV["REDIS_URL"])
 else
  $redis = Redis.new(:host => 'localhost', :port => 6379)
 end 