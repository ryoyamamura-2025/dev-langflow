FROM langflowai/langflow:latest
WORKDIR /app
COPY ./.env ./
EXPOSE 8080
CMD ["python3", "-m", "langflow", "run", "--host", "0.0.0.0", "--port", "8080", "--env-file", "./.env"]