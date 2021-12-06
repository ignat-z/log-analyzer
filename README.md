# Log Analyzer

[![Ruby](https://github.com/ignat-z/log-analyzer/actions/workflows/ruby.yml/badge.svg)](https://github.com/ignat-z/log-analyzer/actions/workflows/ruby.yml) [![codecov](https://codecov.io/gh/ignat-z/log-analyzer/branch/main/graph/badge.svg?token=25KPDEY59D)](https://codecov.io/gh/ignat-z/log-analyzer)

This app is a simple log analyzer. It uses [MapReduce model](<https://en.wikipedia.org/wiki/MapReduce>) to process data. It provides reusable components to combine them into a MapReduce pipeline. It's not parallelized but can be.

## Component groups:

- **input** - return input data _(ex: content of log file )_
- **input_formatter** - format input data to records _(ex: split content by lines)_
- **mapper** - map input data to key-value pairs _(ex: return [path, view count] from each line  )_
- **reducer** - reduce data from mapper in some way _(ex: sum up view counts)_
- **reporter** - reports result _(ex: print to console)_
- **output_formatter** - format output data _(ex: sort the results)_
- **mapper_output_collector** - collect mapper output _(ex: store map results in a list)_
- **reducer_output_collector** - collect reducer output _(ex: store reduce results in a single value)_

## Running


```bash
./bin/parser.rb data/webserver.log
```

## Requirements

Ruby 3.0.3 or higher

The app doesn't use any libraries and can be run in any Ruby environment. It's necessary to install gems by `bundle install` command to be able to run the checks and collect the coverage.

## Available commands

```bash
rake test    # will run test
rake rubocop # will run rubocop
rake         # will run test + rubocop
```


## Checks

### List of webpages with most page views ordered from most pages views to less page views
`cut -d" "  -f1 webserver.log | sort | uniq -c | sort -n -r`

### List of unique page views ordered from most pages views to less page views
`cut -d" " -f 1,2 webserver.log | sort | uniq | cut -d" "  -f1 | uniq -c | sort -n -r`
