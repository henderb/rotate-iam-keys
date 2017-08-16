require 'aws-sdk'

##########
# Options that could be arguments

#age_threshold = 90

##########

format = "%-25s %-6s %s\n"

iam = Aws::IAM::Client.new

# Header
printf format, "User", "Key", "Created"

users = iam.list_users.users
users.each do |user|
  keys = iam.list_access_keys({user_name: user.user_name})
  keys.each do |key|
    meta = key.access_key_metadata.first
    printf format, meta.user_name, meta.access_key_id[-4,4], meta.create_date
  end
end
