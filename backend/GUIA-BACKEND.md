# Backend novo (Apps Script) – passo a passo

O `Codigo.gs` desta pasta já inclui tudo do sistema anterior, mais: papel **publicidade**, 4 novos espaços de
propaganda (cabeçalho, menu, meio, coluna da esquerda), relógio de contagem, aba Usuários e funções de preparação.

## 1. Conta e planilha novas
1. Entre com o **e-mail novo** (conta Google que será dona do sistema) em https://sheets.google.com e crie uma planilha em branco (ex.: "Bolao Novo").
2. Na planilha: **Extensões > Apps Script**. Apague o código que vier e cole **todo** o conteúdo de `Codigo.gs`. Salve (Ctrl+S).

## 2. Criar as abas (tabelas)
No editor, escolha a função `configurar` no menu de funções e clique em **Executar**. Autorize quando pedir
(conta nova: "Avançado > Acessar projeto (não seguro)" é normal para scripts próprios).
Isso cria as abas Usuarios, Convites, Sessoes, Boloes, Cotas, Jogos, Config, Banners, Imagens, Auditoria e Conferencias.
(As abas não aparecem se a planilha foi aberta fora do script; nesse caso use `configurarPlanilhaPorId`, veja o comentário no código.)

## 3. Criar os dois administradores
No topo do bloco final do arquivo, ache `SETUP_ADMINISTRADORES` e preencha:
```
{ papel: 'admin',       usuario: 'seu.usuario', nome: 'Seu Nome',  senha: 'umaSenhaForte123' },
{ papel: 'publicidade', usuario: 'ads.usuario',  nome: 'Nome Ads', senha: 'outraSenhaForte456' }
```
Usuário: 3 a 30 caracteres (minúsculas, números, ponto, hífen, sublinhado). Senha: mínimo 8.
Salve e execute `criarAdministradores`. **Depois apague as senhas do arquivo e salve de novo.**

Alternativa por convite: execute `primeiroAdmin` (convite do administrador principal) ou `convitePropagandas`
(convite do administrador de propagandas). O código aparece em **Execuções/Registro** e vale 72 h, uso único.

## 4. Testar o ambiente
Execute `testeRapido`. O registro deve terminar com "TESTE RÁPIDO: TUDO OK".

## 5. Publicar a API
1. **Implantar > Nova implantação > tipo: App da Web**.
2. Executar como: **Eu**. Quem tem acesso: **Qualquer pessoa**. Implantar.
3. Copie a URL que termina em `/exec`. Abrir essa URL deve mostrar `{"ok":true,"servico":"bolao-api","versao":"10"}`.
4. Cole essa URL em `API_URL` no `config.js` do site e publique o site de novo.
Sempre que alterar o código: **Implantar > Gerenciar implantações > lápis > Nova versão > Implantar**.

## 6. Quem pode o quê
- `admin`: bolões, cotas e aprovações, auditoria, conferência, convites, usuários, PIX, banners, limpeza, relógio.
- `publicidade`: espaços de propaganda (imagem ou código), resultados das loterias e relógio. Não vê PIX, bolões nem clientes.
- `participante`: o de sempre.
