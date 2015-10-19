require "refile/s3"

aws = {
  access_key_id: ENV['S3_KEY'],
  secret_access_key: ENV['S3_SECRET'],
  region: "ap-southeast-2",
  bucket: "hughfm-wdi-project-2",
}

Refile.cache = Refile::S3.new(prefix: "cache", **aws)
Refile.store = Refile::S3.new(prefix: "store", **aws)
Refile.cdn_host = "//d380ny7ob5f9xn.cloudfront.net"
