require 'aws-sdk'

##########
# Options that could be arguments

#region = 'us-west-2'
#age_threshold = 90

##########

format = "%-20s %-6s %s\n"

#iam = Aws::IAM::Client.new(region: region)
iam = Aws::IAM::Client.new
keys = iam.list_access_keys

# Header
printf format, "User", "Key", "Created"

keys.each do |key|
  meta = key.access_key_metadata.first
  printf format, meta.user_name, meta.access_key_id[-4,4], meta.create_date
end
