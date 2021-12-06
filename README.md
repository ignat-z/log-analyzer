## Running

```bash
./parser.rb webserver.log
```

## Requirements

Ruby 3.0.3 or higher

## Checks

### List of webpages with most page views ordered from most pages views to less page views
`cut -d" "  -f1 webserver.log | sort | uniq -c | sort -n -r`

### List of unique page views ordered from most pages views to less page views
`cut -d" " -f 1,2 webserver.log | sort | uniq | cut -d" "  -f1 | uniq -c | sort -n -r`
