# Utiliser une image officielle Python avec Streamlit
FROM python:3.10-slim

# Empêcher les prompts interactifs
ENV DEBIAN_FRONTEND=noninteractive

# Installer les dépendances système nécessaires
RUN apt-get update && apt-get install -y \
    libgl1-mesa-glx \
    libglib2.0-0 \
 && rm -rf /var/lib/apt/lists/*

# Créer un dossier pour l'app
WORKDIR /app

# Copier tout le contenu du repo dans le container
COPY . .

# Installer les dépendances Python
RUN pip install --upgrade pip
RUN pip install -r requirements.txt

# Exposer le port utilisé par Streamlit
EXPOSE 7860

# Lancer l'application Streamlit
CMD ["streamlit", "run", "src/streamlit_app.py", "--server.port=7860", "--server.enableCORS=false"]
