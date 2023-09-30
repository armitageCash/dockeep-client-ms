#!/bin/bash

# Nombre de la pila de CloudFormation
stack_name="dockep-clients-ms-stack"

# Nombre del archivo JSON de la plantilla
template_file="cloudformation-definition.json"

# Nombre del archivo JSON de parámetros (opcional)
# parameters_file="mis-parametros.json"

# Nombre del archivo JSON de tags (opcional)

# Región de AWS donde deseas crear la pila
region="us-east-2"

# Comando para crear la pila de CloudFormation
aws cloudformation create-stack \
    --stack-name "$stack_name" \
    --template-body "file://$template_file" \
    --region "$region"
   #  --parameters "file://$parameters_file" \
   #  --tags "file://$tags_file" \

# Verificar si la creación de la pila fue exitosa
if [ $? -eq 0 ]; then
    echo "Pila de CloudFormation creada con éxito."
else
    echo "Error al crear la pila de CloudFormation."
fi
