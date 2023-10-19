#!/bin/bash

API_ID=$(aws apigateway get-rest-apis --query "items[?name=='users'].id" --output text)

if [ -n "$API_ID" ]; then

  echo "API Gateway users existe, actualizando..."
  api_id=$API_ID

  aws apigateway put-rest-api --body "fileb://main.yml" --query 'id' --output text --mode merge --rest-api-id "$api_id"
  echo "API ID: $api_id"

  STAGE_NAME="develop"
  VARIABLE_NAME="ECS_ELB_ENDPOINT"
  VARIABLE_VALUE="http://dockeep-users-ms-elb-1445705399.us-east-2.elb.amazonaws.com/"

  deployment_id=$(aws apigateway create-deployment \
    --rest-api-id "$api_id" \
    --stage-name "develop" \
    --stage-description 'Development Stage' \
    --description 'Update deployment to the dev stage' \
    --query "id" --output text)

  if aws apigateway get-stage --rest-api-id "$api_id" --stage-name "$STAGE_NAME" &> /dev/null; then
    aws apigateway update-stage \
      --rest-api-id "$api_id" \
      --stage-name "$STAGE_NAME" \
      --patch-operations "op=replace,path=/variables/$VARIABLE_NAME,value=$VARIABLE_VALUE"
  else
    aws apigateway create-stage \
      --rest-api-id "$api_id" \
      --stage-name "$STAGE_NAME" \
      --deployment-id "$deployment_id" \
      --variables "$VARIABLE_NAME=$VARIABLE_VALUE"
  fi

else
  echo "API Gateway users no existe, importando..."
  api_id=$(aws apigateway import-rest-api --body "fileb://main.yml" --query 'id' --output text)
  echo "API ID: $api_id"
fi