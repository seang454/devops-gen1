ab -n 1000000 -c 100 -t 180 http://<NGINX-SERVICE-IP>/
```

## What each parameter means:

### `ab`
- **Apache Bench** - A command-line tool for load testing HTTP servers

### `-n 1000000`
- **Number of requests**: Send 1,000,000 total requests
- `-n` = number of requests to perform

### `-c 100`
- **Concurrency**: 100 simultaneous/parallel connections
- `-c` = number of multiple requests to make at a time
- Like having 100 users hitting your server at the same time

### `-t 180`
- **Time limit**: Run for 180 seconds (3 minutes)
- `-t` = maximum seconds to spend on benchmarking
- **Note**: This will override `-n` if time runs out first

### `http://<NGINX-SERVICE-IP>/`
- The URL to test (replace `<NGINX-SERVICE-IP>` with actual IP)

## What it does:
```
┌─────────────────────────────────────────┐
│  Apache Bench sends requests like this: │
└─────────────────────────────────────────┘

Time: 0s ───────────────────────> 180s (3 minutes)
      ↓                           ↓
     [====================100 concurrent connections====================]
     [===================================================================]
     Each connection repeatedly sends: GET / HTTP/1.1
     
Total: Up to 1,000,000 requests OR 3 minutes (whichever comes first)