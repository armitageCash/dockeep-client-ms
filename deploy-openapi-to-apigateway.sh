#!/bin/bash

api_id=$(aws apigateway import-rest-api --body "fileb://main.yml" --query 'id' --output text)
echo "API ID: $api_id"

# Exporta el valor de api_id como variable de entorno
export API_ID="$api_id"

# Define la etapa y la variable que deseas configurar
STAGE_NAME="develop" # Cambia "production" a "develop"
VARIABLE_NAME="ECS_ELB_ENDPOINT"
VARIABLE_VALUE="http://dockeep-clients-ms-elb-1163464849.us-east-2.elb.amazonaws.com/"

# Crear una nueva implementación (deployment)
deployment_id=$(aws apigateway create-deployment \
  --rest-api-id "$API_ID" \
  --stage-name "develop" \
  --stage-description 'Development Stage' \
  --description 'First deployment to the dev stage' \
  --query "id" --output text)

# Verifica si la etapa ya existe
if aws apigateway get-stage --rest-api-id "$API_ID" --stage-name "$STAGE_NAME" &> /dev/null; then
  # Si la etapa ya existe, actualiza la variable
  aws apigateway update-stage \
    --rest-api-id "$API_ID" \
    --stage-name "$STAGE_NAME" \
    --deployment-id "$deployment_id" \
    --patch-operations "op=replace,path=/variables/$VARIABLE_NAME,value=$VARIABLE_VALUE"
else
  # Si la etapa no existe, crea la etapa y establece la variable
  aws apigateway create-stage \
    --rest-api-id "$API_ID" \
    --stage-name "$STAGE_NAME" \
    --deployment-id "$deployment_id" \
    --variables "$VARIABLE_NAME=$VARIABLE_VALUE"
fi

# Aquí puedes agregar cualquier otro paso que necesites en tu script
