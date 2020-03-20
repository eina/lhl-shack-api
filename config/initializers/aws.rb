# Aws.config(
#   :access_key_id => ENV['AWS_ACCESS_KEY_ID'],
#   :secret_access_key => ENV['AWS_SECRET_ACCESS_KEY']
# )

# s3 = Aws::S3::Resource.new(region: "us-west-2")
# bucket = s3.bucket(ENV['S3_BUCKET'])

# S3_BUCKET =  AWS::S3.new.buckets[ENV['S3_BUCKET']]

Aws.config.update({
   credentials: Aws::Credentials.new(ENV['AWS_ACCESS_KEY_ID'], ENV['AWS_SECRET_ACCESS_KEY']),
   region: 'us-west-2'
})