# Bolão da Sorte

Site estático (HTML/CSS/JS) com backend em Google Apps Script.

## Estrutura
- `index.html` – app (login, participante, administradores)
- `publico.html` – página pública dos jogos confirmados
- `css/`, `js/` – estilos e scripts
- `config.js` – **URL do Apps Script (/exec)**; precisa existir na raiz (veja COMANDOS.md)
- `backend/` – Código.gs (Apps Script) e guia de configuração

## Papéis
- `admin`: bolões, clientes, aprovações, auditoria, conferência, convites, usuários, configurações
- `publicidade`: propagandas, resultados das loterias e relógio de contagem
- `participante`
