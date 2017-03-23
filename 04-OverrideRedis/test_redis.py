import redis
rs = redis.Redis("localhost")
print 'Redis version running is %s' % rs.info()['redis_version']
