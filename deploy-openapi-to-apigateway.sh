#!/bin/bash

# Comando para importar la definición OpenAPI desde S3 y obtener el ID de la API
api_id=$(aws apigateway import-rest-api --body "fileb://main.yml" --query 'id' --output text)
echo "API ID: $api_id"

# Luego, puedes exportar el valor del api-id para que esté disponible para otros comandos
echo "::set-env name=API_ID::$api_id"

# Define la etapa y la variable que deseas configurar
STAGE_NAME="develop" # Cambia "production" a "develop"
VARIABLE_NAME="ECS_ELB_ENDPOINT"
VARIABLE_VALUE="your-elb-url-here"

# Configura la stageVariable en tu API Gateway utilizando la variable api_id
aws apigateway update-stage \
  --rest-api-id "$api_id" \
  --stage-name "$STAGE_NAME" \
  --patch-operations "op=replace,path=/variables/$VARIABLE_NAME,value=$VARIABLE_VALUE"

# Aquí puedes agregar cualquier otro paso que necesites en tu script
