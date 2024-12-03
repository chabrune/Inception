# 🐳 Inception - Infrastructure Docker Multi-Services

Un projet d'administration système visant à mettre en place une infrastructure de services conteneurisés.

## 📝 Description

Création d'une infrastructure complète utilisant Docker avec WordPress, NGINX, et MariaDB, chacun dans son propre conteneur.

## 🛠️ Services Requis

### Conteneurs
- NGINX (TLSv1.2/1.3)
- WordPress + php-fpm
- MariaDB

### Volumes
- Base de données WordPress
- Fichiers WordPress

### Configuration
- Docker Network dédié
- Redémarrage automatique des conteneurs
- Variables d'environnement sécurisées
- Accès uniquement via NGINX (port 443)

## ⚙️ Spécifications Techniques

### Sécurité
- TLS obligatoire
- Pas de mots de passe dans les Dockerfiles
- Gestion des secrets Docker
- Variables d'environnement dans .env

### Infrastructure
- Images basées sur Alpine/Debian
- Dockerfiles personnalisés
- Configuration via docker-compose
- Volumes persistants dans /home/login/data

## 🌟 Bonus
- Redis cache pour WordPress
- Serveur FTP
- Site statique personnalisé
- Adminer
- Service supplémentaire justifié

---
*Projet réalisé dans le cadre du cursus de l'école 42* 🚀
