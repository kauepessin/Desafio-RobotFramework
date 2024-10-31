# Usar uma imagem base do Python
FROM python:3.9-slim

WORKDIR /app

RUN apt-get update && apt-get install -y \
    curl \
    gcc \
    libffi-dev \
    libssl-dev \
    npm \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

RUN apt-get update && apt-get install -y \
    curl \
    && curl -sL https://deb.nodesource.com/setup_14.x | bash - \
    && apt-get install -y nodejs \
    && apt-get install -y npm \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Copiar o arquivo de requisitos, se houver
COPY requirements.txt .

# Instalar o Robot Framework e outros requisitos
RUN pip install --no-cache-dir -r requirements.txt

# Instale o Robot Framework Browser
RUN pip install robotframework-browser

RUN rfbrowser init

RUN npx playwright install-deps

# Copiar os testes para a imagem
COPY . .

# Definir o comando padrão
CMD ["robot", "-d", "--listener", "RetryFailed", "/app/logs", "tests"]
