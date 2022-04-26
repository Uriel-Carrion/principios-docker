# syntax=docker/dockerfile:1
FROM python:3.7-alpine
#Creación de un directorio de trabajo de docker 
WORKDIR /code
#Variables de entorno de Flask
ENV FLASK_APP=app.py
ENV FLASK_RUN_HOST=0.0.0.0

#Ejecución de paquetes para que python vaya más rápido 
RUN apk add --no-cache gcc musl-dev linux-headers

#Instalación de dependencias de flask
COPY requirements.txt requirements.txt
RUN pip install -r requirements.txt

#Se expone el puerto
EXPOSE 5000

#Se copia el directorio del código local  al contenedor 
COPY . .

#Ejecucuón del código 
CMD ["flask", "run"]