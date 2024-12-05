# Utiliser l'image de base officielle de OpenJDK
FROM openjdk:17-jdk-slim

# Définir l'emplacement du répertoire de travail dans le conteneur
WORKDIR /app

# Copier le fichier jar généré dans le conteneur
COPY target/User-Service-0.0.1-SNAPSHOT.jar app.jar

# Exposer le port sur lequel votre application Spring Boot va s'exécuter
EXPOSE 8880

# Définir la commande pour démarrer l'application Spring Boot
ENTRYPOINT ["java", "-jar", "app.jar"]
