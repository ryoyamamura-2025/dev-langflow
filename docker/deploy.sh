#!/bin/bash
set -euo pipefail

# ==== 事前設定 ====
PROJECT_ID="arcane-antler-460612-d2"
REGION="us-central1"
SERVICE_NAME="langflow-service"
IMAGE_NAME="langflow-image"
IMAGE_TAG="v1"
IMAGE_URI="gcr.io/${PROJECT_ID}/${IMAGE_NAME}:${IMAGE_TAG}"

# API が有効か確認
echo "Enabling required APIs..."
gcloud services enable run.googleapis.com cloudbuild.googleapis.com --project "${PROJECT_ID}"

# ==== Cloud Run にデプロイ ====
echo "Deploying to Cloud Run..."
gcloud run deploy "${SERVICE_NAME}" \
  --region "${REGION}" \
  --allow-unauthenticated \
  --project "${PROJECT_ID}" \
  --source . \
  --memory "2Gi" \

echo "Deployment complete! Service URL:"
gcloud run services describe "${SERVICE_NAME}" \
  --platform managed \
  --region "${REGION}" \
  --project "${PROJECT_ID}" \
  --format="value(status.url)"
