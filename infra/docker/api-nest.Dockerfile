FROM node:20-alpine AS builder
WORKDIR /repo
COPY . .
ENV CI=true
RUN corepack enable && pnpm i --frozen-lockfile && pnpm -F @cashquest/api-nest build

FROM node:20-alpine
WORKDIR /app
ENV NODE_ENV=production
COPY --from=builder /repo/apps/api-nest/dist ./dist
COPY apps/api-nest/package.json .
RUN corepack enable && pnpm i --prod --no-lockfile
EXPOSE 3000
CMD ["node", "dist/main.js"]
