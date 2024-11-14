function aws-localstack
  
  set -x AWS_ACCESS_KEY_ID "test"
  set -x AWS_SECRET_ACCESS_KEY "test"
  set -x AWS_DEFAULT_REGION "us-east-1"
  set -x AWS_LOCALSTACK_ENDPOINT "http://localhost:4566"

  aws --endpoint-url=$AWS_LOCALSTACK_ENDPOINT $argv[1..-1]

end