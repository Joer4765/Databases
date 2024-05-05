#!/bin/bash

# Task 1.1
redis-cli set students:oleksandr "{name: 'My Name', university: 'CHNU', group: 'IPZ243', id: 1}"
redis-cli get students:oleksandr

# Task 1.2
redis-cli strlen students:oleksandr
redis-cli getrange students:oleksandr 1 40
redis-cli setrange students:oleksandr 41 " extra !data!"
redis-cli get students:oleksandr

# Task 1.3
redis-cli hset students:hash_oleksandr name "Oleksandr" university "CHNU" group "IPZ243" id 1 # hash set
redis-cli hset students:hash_oleksandr age 20
redis-cli hgetall students:hash_oleksandr
redis-cli hget students:hash_oleksandr id
redis-cli hdel students:hash_oleksandr university
redis-cli hgetall students:hash_oleksandr

# Task 1.4
redis-cli lpush actions:oleksandr filter:1 delete:2 update:3 read:4 create:5 # list
redis-cli lrange actions:oleksandr 0 -1
redis-cli ltrim actions:oleksandr -3 -1
redis-cli lrange actions:oleksandr 0 -1

# Task 1.5
redis-cli sadd subjects:1 "Math" "Physics" "Chemistry" "Biology" "English" # set
redis-cli sadd subjects:2 "History" "Geography" "Math" "Literature" "Physics"
redis-cli sismember subjects:1 "Math"
redis-cli sismember subjects:2 "Math"
redis-cli sinterstore common_subjectss subjects:1 subjects:2
redis-cli smembers common_subjectss

# Task 1.6
redis-cli zadd subjects 75 "Math" 80 "Physics" 65 "Chemistry" 85 "Biology" 70 "English" # sorted set
redis-cli zcount subjects 71 inf
redis-cli zrevrank subjects "Physics" # Reversed ranking from 0

# Task 1.7
redis-cli set temporary:key "This Key Will Expire"
redis-cli expire temporary:key 60
redis-cli set birth:key "This Key Will Expire on Birthday"
redis-cli expireat birth:key 1746076800 # timestamp
redis-cli ttl temporary:key
redis-cli ttl berth:key # time to live