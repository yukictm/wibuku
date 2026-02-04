# Gunakan image Node.js LTS
FROM node:20-alpine

# Set working directory
WORKDIR /app

# Copy package.json dan lock file
COPY package.json yarn.lock ./

# Install dependencies
RUN yarn install --frozen-lockfile

# Copy semua file proyek
COPY . .

# Build aplikasi Next.js
RUN yarn build

# Set environment variables
ENV NODE_ENV=production
ENV PORT=7860

# Expose port yang digunakan Hugging Face Spaces
EXPOSE 7860

# Start aplikasi
CMD ["yarn", "start"]
