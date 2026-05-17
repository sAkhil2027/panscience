# =========================
# Base Image
# =========================
FROM python:3.11-slim

# =========================
# Environment Variables
# =========================
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

# =========================
# Working Directory
# =========================
WORKDIR /app

# =========================
# System Dependencies
# =========================
RUN apt-get update && apt-get install -y \
    build-essential \
    gcc \
    curl \
    && rm -rf /var/lib/apt/lists/*

# =========================
# Copy Requirements First
# =========================
COPY requirements.txt .

# =========================
# Install Python Dependencies
# =========================
RUN pip install --upgrade pip

RUN pip install --no-cache-dir -r requirements.txt

# =========================
# Copy Project Files
# =========================
COPY . .

# =========================
# Streamlit Configuration
# =========================
RUN mkdir -p /root/.streamlit

RUN echo "\
[server]\n\
headless = true\n\
port = 8501\n\
enableCORS = false\n\
enableXsrfProtection = false\n\
" > /root/.streamlit/config.toml

# =========================
# Expose Port
# =========================
EXPOSE 8501

# =========================
# Start Application
# =========================
CMD ["streamlit", "run", "streamlit_rag_frontend.py", "--server.port=8501", "--server.address=0.0.0.0"]