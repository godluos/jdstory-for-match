CarrierWave.configure do |config|
  config.storage             = :qiniu
  config.qiniu_access_key    = ENV["88OICUrDCeOhLmNRs8Y13c5FaM53f3OOlktMnIj4"]
  config.qiniu_secret_key    = ENV["SKtCaucDQbLVGbJXc9aUXQE4b1gSx4v-xi6PjkUv"]
  config.qiniu_bucket        = ENV["ls-jdstore"]
  config.qiniu_bucket_domain = ENV["oqln1t1a2.bkt.clouddn.com"]
  config.qiniu_block_size    = 4*1024*1024
  config.qiniu_protocol      = "http"
  config.qiniu_up_host       = "http://up.qiniug.com"  #选择不同的区域时，up.qiniug.com 不同
end
