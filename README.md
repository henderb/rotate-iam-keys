# Setup

## AWS Credentials

You will need:

 - AWS Keys in the default location (~/.aws/credentials on Linux and Mac)

Just write the ini file

```
[default]
aws_access_key_id = XXXXX
aws_secret_access_key = XXXXXX
```

Or on CentOS 7 using the AWS CLI this was something along the lines of:

```
sudo yum install python-pip
sudo pip install awscli
aws configure
```

Using VirtualEnv would probably have been better. AWS Linux has it already installed I think, so you could just assign an IAM Role and run the script.

## Ruby

Install ruby, bundler, and the aws-sdk gem listed in the Gemfile.

```
sudo yum install ruby-devel
gem install bundler
cd rotate-iam-keys
bundle
```

# Run It

Run the script with Ruby

```
cd rotate-iam-keys
ruby list_keys.rb
```

You should get something like:

```
User                 Key    Created
brian.henderson      T2SQ   2017-08-10 21:45:01 UTC
```
