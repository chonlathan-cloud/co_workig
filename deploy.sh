#!/bin/bash

# Exit immediately if a command exits with a non-zero status
set -e

PROJECT_ID="lineoa-g49"
IMAGE_NAME="website"
REGION="asia-southeast1"
TAG="asia-southeast1-docker.pkg.dev/$PROJECT_ID/website/$IMAGE_NAME"

echo "======================================================"
echo "Deploying to Google Cloud Run"
echo "Project ID: $PROJECT_ID"
echo "Region: $REGION"
echo "Image: $TAG"
echo "======================================================"

# Submit the build to Cloud Build
echo "Step 1: Building image with Cloud Build..."
gcloud builds submit --tag "$TAG" .

# Deploy to Cloud Run
echo "Step 2: Deploying to Cloud Run..."
gcloud run deploy "$IMAGE_NAME" \
  --image "$TAG" \
  --platform managed \
  --region "$REGION" \
  --allow-unauthenticated

echo "======================================================"
echo "Deployment Complete!"
echo "======================================================"
