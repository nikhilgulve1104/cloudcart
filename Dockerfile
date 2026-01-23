FROM python:3.9-slim

# Create non-root user
RUN useradd -m appuser

WORKDIR /app

# Upgrade pip (IMPORTANT FIX)
RUN pip install --upgrade pip

# Copy dependencies
COPY requirements.txt .

# Install dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy app
COPY app.py .

# Permissions
RUN chown -R appuser:appuser /app

USER appuser

EXPOSE 5000

CMD ["python", "app.py"]

