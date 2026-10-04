# Estágio 1: Compilação do código fonte
FROM node:22-alpine AS builder

WORKDIR /app

# Habilita o pnpm nativo do Node.js (fixando versao 9 para compatibilidade)
RUN corepack enable && corepack prepare pnpm@9 --activate

# Copia os arquivos de manifesto de dependências
COPY package.json pnpm-lock.yaml ./

# Instala as dependências do projeto
RUN pnpm install --frozen-lockfile

# Copia todo o código fonte e gera a build de produção
COPY . .
RUN pnpm run build

# Estágio 2: Servidor estático leve com Nginx
FROM nginx:alpine AS runner

# Copia o resultado do build para a pasta padrão do Nginx
COPY --from=builder /app/dist /usr/share/nginx/html

# Expõe a porta 80 do container
EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]