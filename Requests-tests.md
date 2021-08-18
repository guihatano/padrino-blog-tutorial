# Requests tests

## My notebook configuration

- **OS**: Ubuntu 18.04.5 LTS (Bionic Beaver) 64-bit
- **Processor**: Intel Core i7-9750H CPU @ 2.60GHz x 12
- **Memory**: 24 GB RAM @ 2667MHz
- **SSD**: Intel SSD NVMe 512 GB (SSDPEKNW512G8)
  - Sequential Bandwidth - 100% Read (up to) 1500 MB/s
  - Sequential Bandwidth - 100% Write (up to) 1000 MB/s

## Siege

- -t 5S = 5 seconds of test
- -c 1000 = 1000 CONCURRENT users

```shell
siege -t 5S -c 1000 http://localhost:3000
** SIEGE 4.0.4
** Preparing 1000 concurrent users for battle.
The server is now under siege...
Lifting the server siege...
Transactions:          3849 hits
Availability:        100.00 %
Elapsed time:          4.64 secs
Data transferred:         0.10 MB
Response time:          0.41 secs
Transaction rate:       829.53 trans/sec
Throughput:          0.02 MB/sec
Concurrency:        341.74
Successful transactions:        3849
Failed transactions:            0
Longest transaction:         4.57
Shortest transaction:         0.01
```

```shell
siege -t 5S -c 1000 http://localhost:3000
** SIEGE 4.0.4
** Preparing 1000 concurrent users for battle.
The server is now under siege...
Lifting the server siege...
Transactions:          2989 hits
Availability:        100.00 %
Elapsed time:          4.39 secs
Data transferred:         0.07 MB
Response time:          0.49 secs
Transaction rate:       680.87 trans/sec
Throughput:          0.02 MB/sec
Concurrency:        333.67
Successful transactions:        2989
Failed transactions:            0
Longest transaction:         3.91
Shortest transaction:         0.10
```

```shell
siege -t 10S -c 1000 http://localhost:3000
** SIEGE 4.0.4
** Preparing 1000 concurrent users for battle.
The server is now under siege...[error] descriptor table full sock.c:133: Too many open files
[error] descriptor table full sock.c:133: Too many open files
[error] Unknown error code from gethostbyname for localhost
: Too many open files
[error] descriptor table full sock.c:133: Too many open files
[error] Unknown error code from gethostbyname for localhost
: Too many open files
[error] descriptor table full sock.c:133: Too many open files
...
```

## ApacheBench

- -n 5000 = 5000 requests (Number of requests to perform)
- -c 1000 = 1000 concurrency (Number of multiple requests to make at a time)

```shell
ab -n 5000 -c 1000 http://localhost:3000/
This is ApacheBench, Version 2.3 <$Revision: 1807734 $>
Copyright 1996 Adam Twiss, Zeus Technology Ltd, http://www.zeustech.net/
Licensed to The Apache Software Foundation, http://www.apache.org/

Benchmarking localhost (be patient)
Completed 500 requests
Completed 1000 requests
Completed 1500 requests
Completed 2000 requests
Completed 2500 requests
Completed 3000 requests
Completed 3500 requests
Completed 4000 requests
Completed 4500 requests
apr_pollset_poll: The timeout specified has expired (70007)
Total of 4940 requests completed
```

```shell
ab -n 5000 -c 500 http://localhost:3000/
This is ApacheBench, Version 2.3 <$Revision: 1807734 $>
Copyright 1996 Adam Twiss, Zeus Technology Ltd, http://www.zeustech.net/
Licensed to The Apache Software Foundation, http://www.apache.org/

Benchmarking localhost (be patient)
Completed 500 requests
Completed 1000 requests
Completed 1500 requests
Completed 2000 requests
Completed 2500 requests
Completed 3000 requests
Completed 3500 requests
Completed 4000 requests
Completed 4500 requests
apr_socket_recv: Connection reset by peer (104)
Total of 4836 requests completed
```

```shell
ab -n 5000 -c 500 http://localhost:3000/
This is ApacheBench, Version 2.3 <$Revision: 1807734 $>
Copyright 1996 Adam Twiss, Zeus Technology Ltd, http://www.zeustech.net/
Licensed to The Apache Software Foundation, http://www.apache.org/

Benchmarking localhost (be patient)
Completed 500 requests
Completed 1000 requests
Completed 1500 requests
Completed 2000 requests
Completed 2500 requests
Completed 3000 requests
Completed 3500 requests
Completed 4000 requests
Completed 4500 requests
Completed 5000 requests
Finished 5000 requests


Server Software:        WEBrick/1.6.1
Server Hostname:        localhost
Server Port:            3000

Document Path:          /
Document Length:        26 bytes

Concurrency Level:      500
Time taken for tests:   14.637 seconds
Complete requests:      5000
Failed requests:        0
Total transferred:      3835000 bytes
HTML transferred:       130000 bytes
Requests per second:    341.60 [#/sec] (mean)
Time per request:       1463.709 [ms] (mean)
Time per request:       2.927 [ms] (mean, across all concurrent requests)
Transfer rate:          255.86 [Kbytes/sec] received

Connection Times (ms)
              min  mean[+/-sd] median   max
Connect:        0  112 328.9      0    3031
Processing:    46  633 1767.0    215   13594
Waiting:       46  632 1767.0    213   13594
Total:         67  746 1966.8    221   14617

Percentage of the requests served within a certain time (ms)
  50%    221
  66%    298
  75%    388
  80%    459
  90%   1205
  95%   2374
  98%   7952
  99%  14483
 100%  14617 (longest request)
```

```shell
ab -n 4000 -c 500 http://localhost:3000/
This is ApacheBench, Version 2.3 <$Revision: 1807734 $>
Copyright 1996 Adam Twiss, Zeus Technology Ltd, http://www.zeustech.net/
Licensed to The Apache Software Foundation, http://www.apache.org/

Benchmarking localhost (be patient)
Completed 400 requests
Completed 800 requests
Completed 1200 requests
Completed 1600 requests
Completed 2000 requests
Completed 2400 requests
Completed 2800 requests
Completed 3200 requests
Completed 3600 requests
Completed 4000 requests
Finished 4000 requests


Server Software:        WEBrick/1.6.1
Server Hostname:        localhost
Server Port:            3000

Document Path:          /
Document Length:        26 bytes

Concurrency Level:      500
Time taken for tests:   14.796 seconds
Complete requests:      4000
Failed requests:        0
Total transferred:      3068000 bytes
HTML transferred:       104000 bytes
Requests per second:    270.35 [#/sec] (mean)
Time per request:       1849.454 [ms] (mean)
Time per request:       3.699 [ms] (mean, across all concurrent requests)
Transfer rate:          202.50 [Kbytes/sec] received

Connection Times (ms)
              min  mean[+/-sd] median   max
Connect:        0  151 370.1      0    3042
Processing:    43  883 2091.4    302   13758
Waiting:       43  878 2091.6    296   13758
Total:         62 1034 2308.5    322   14779

Percentage of the requests served within a certain time (ms)
  50%    322
  66%    454
  75%    619
  80%    781
  90%   1598
  95%   7822
  98%   8021
  99%  14672
 100%  14779 (longest request)
```

## Conclusion

Padrino has some difficult to handle too many concurrent requests
