# Stage 1: Builder
FROM python:3.9-slim as builder

WORKDIR /app

# Copy necessary files for the build script
COPY embed_image.py .
COPY eagle_base64.txt .
COPY index.html .

# Run the embedding script
RUN python embed_image.py

# Stage 2: Final
FROM nginx:alpine

# Copy the processed index.html from the builder stage
COPY --from=builder /app/index.html /usr/share/nginx/html/index.html

# Copy other static assets directly from the context
COPY logo.png /usr/share/nginx/html/
COPY eagle-brand.png /usr/share/nginx/html/
COPY step1.jpg /usr/share/nginx/html/
COPY step2.jpg /usr/share/nginx/html/
COPY step3.jpg /usr/share/nginx/html/
COPY step4.jpg /usr/share/nginx/html/
COPY MIA.mp4 /usr/share/nginx/html/

# Expose port 80
EXPOSE 80

# Start Nginx
CMD ["nginx", "-g", "daemon off;"]
