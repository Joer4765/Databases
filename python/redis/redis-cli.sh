#!/bin/bash

# Connecting to redis server. Update the host and port as per your Redis server configuration
redis-cli -h localhost -p 6379

# Task 1.1: Create a key with your details and get the value
redis-cli SET students:myname "{name: 'My Name', university: 'CHNU', group: 'IPZ243', id: 1}"
redis-cli GET students:myname

# Task 1.2: Get the length of the value, extract a substring and update the value
redis-cli STRLEN students:myname
redis-cli GETRANGE students:myname 1 40
redis-cli APPEND students:myname " extra !data!"
redis-cli GET students:myname

# Task 1.3: Create a hash table, add a field, get all fields and values, get field 'id', and delete field 'university'
redis-cli HMSET students:hash_myname name "My Name" university "CHNU" group "IPZ243" id 1
redis-cli HSET students:hash_myname age 20
redis-cli HGETALL students:hash_myname
redis-cli HGET students:hash_myname id
redis-cli HDEL students:hash_myname university

# Task 1.4: Create a list to describe a sequence of actions, get the list, and trim the list
redis-cli LPUSH actions:myname "open:page1" "open:page2" "order:ticket" "order:ticket2" "buy:all"
redis-cli LRANGE actions:myname 0 -1
redis-cli LTRIM actions:myname -3 -1
redis-cli LRANGE actions:myname 0 -1

# Task 1.5: Create sets for subjects in two semesters, check membership, identify common subjects
redis-cli SADD subject:1 "Math" "Physics" "Chemistry" "Biology" "English"
redis-cli SADD subject:2 "History" "Geography" "Math" "Literature" "Physics"
redis-cli SISMEMBER subject:1 "Math"
redis-cli SISMEMBER subject:2 "Math"
redis-cli SINTERSTORE common_subjects subject:1 subject:2
redis-cli SMEMBERS common_subjects

# Task 1.6: Create a sorted set of subjects with scores, find count of subjects with score > 70, get reverse rank
redis-cli ZADD subjects 75 "Math" 80 "Physics" 65 "Chemistry" 85 "Biology" 70 "English"
redis-cli ZCOUNT subjects 71 inf
redis-cli ZREVRANK subjects "Physics"

# Task 1.7: Create expiring keys
redis-cli SET temporary:key "This Key Will Expire"
redis-cli EXPIRE temporary:key 60 # expires after 60 seconds
redis-cli SET expiry:key "This Key Will Expire on Birthday"
redis-cli EXPIREAT expiry:key 1746076800 # Assuming the birthday timestamp as example
redis-cli TTL temporary:key
redis-cli TTL expiry:key

# Exit
exit