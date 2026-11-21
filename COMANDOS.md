# Passo a passo (CMD do Windows)

## 0. Pré-requisitos (uma vez só)
Instale: Git (https://git-scm.com) e Node.js LTS (https://nodejs.org). Depois feche e reabra o CMD.
```
git --version
node --version
```

## 1. Preparar a pasta
Extraia o ZIP, copie os arquivos listados em FALTAM-ESTES-ARQUIVOS.txt e entre na pasta:
```
cd /d C:\caminho\para\bolao-pacote
dir
```

## 2. Identificar-se no Git (uma vez só)
```
git config --global user.name "Seu Nome"
git config --global user.email "seu-email@exemplo.com"
```

## 3. Criar o repositório local
```
git init
git branch -M main
git add .
git commit -m "Bolao da Sorte: admin de propagandas e novos espacos"
```

## 4. Criar o repositório NOVO no GitHub
Opção A, pelo site: https://github.com/new -> nome `bolao-da-sorte` -> **Private** -> NÃO marque README/.gitignore -> Create. Depois:
```
git remote add origin https://github.com/SEU-USUARIO/bolao-da-sorte.git
git push -u origin main
```
(O Git pede login; use o navegador ou um Personal Access Token como senha.)

Opção B, pelo CMD com GitHub CLI:
```
winget install GitHub.cli
gh auth login
gh repo create bolao-da-sorte --private --source=. --remote=origin --push
```

## 5. Netlify novo
Opção A (recomendada, deploy automático a cada push):
1. https://app.netlify.com -> Add new site -> Import an existing project -> GitHub -> escolha `bolao-da-sorte`.
2. Build command: deixe vazio. Publish directory: `.` -> Deploy.

Opção B, pelo CMD:
```
npm install -g netlify-cli
netlify login
netlify init
netlify deploy --prod --dir=.
```
(No `netlify init`: Create & configure a new site; build command vazio; publish directory `.`.)

## 6. Próximas atualizações
```
git add .
git commit -m "descreva a mudanca"
git push
```
(Com a opção A o Netlify publica sozinho.)

## 7. Depois de publicar
- Aplique os ajustes de `backend/GUIA-BACKEND.md` no Código.gs e publique **nova versão** da implantação do Apps Script.
- No `config.js`, confirme que `API_URL` aponta para a implantação /exec.
- Crie o convite "Administrador de propagandas" na aba Convites.
