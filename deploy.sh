#!/bin/bash

set -e

PROJECT_ID="lineoa-g49"
IMAGE_NAME="website"
REGION="asia-southeast1"
TAG="asia-southeast1-docker.pkg.dev/$PROJECT_ID/website/$IMAGE_NAME:latest"

echo "======================================================"
echo "Deploying to Google Cloud Run (local Docker build)"
echo "Project ID: $PROJECT_ID"
echo "Region: $REGION"
echo "Image: $TAG"
echo "======================================================"

echo "Step 1: Build & push image with local Docker..."
docker buildx build \
  --platform linux/amd64 \
  -t "$TAG" \
  --push .

echo "Step 2: Deploy to Cloud Run..."
gcloud run deploy "$IMAGE_NAME" \
  --image "$TAG" \
  --platform managed \
  --region "$REGION" \
  --allow-unauthenticated

echo "======================================================"
echo "Deployment Complete!"
echo "======================================================"