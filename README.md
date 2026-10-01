# 🏖️ Sistema de Solicitação de Férias

Sistema web para gerenciar solicitações de férias da equipe, com banco de dados em nuvem via **Supabase** e exportação em Excel.

## 🚀 Funcionalidades

- ✅ Cadastro e gerenciamento de funcionários
- 📅 Solicitação de férias com 20 ou 30 dias corridos
- 🗓️ Cálculo automático da data de término
- 📊 Exportação para Excel (`.xlsx`)
- ☁️ Dados persistidos em tempo real no Supabase (PostgreSQL)
- 🔍 Filtro de busca por nome

## 🛠️ Tecnologias

| Tecnologia | Uso |
|---|---|
| HTML + CSS + JavaScript | Frontend (sem framework) |
| [Supabase](https://supabase.com) | Banco de dados PostgreSQL em nuvem |
| [SheetJS](https://sheetjs.com) | Exportação Excel |
| [Supabase JS v2](https://supabase.com/docs/reference/javascript) | Client SDK |

## ⚙️ Configuração do Banco de Dados

1. Acesse o [Supabase Dashboard](https://supabase.com/dashboard)
2. Vá em **SQL Editor**
3. Execute o arquivo [`schema.sql`](./schema.sql)

O script cria:
- Tabela `employees` — funcionários cadastrados
- Tabela `vacation_requests` — solicitações de férias
- Políticas de acesso (RLS) para o client anônimo
- Funcionários padrão pré-cadastrados

## 🔑 Variáveis de Configuração

No arquivo `index.html`, linha `<script>`:

```js
const SUPABASE_URL = 'https://SEU_PROJETO.supabase.co';
const SUPABASE_KEY = 'sua-chave-anon-public';
```

## 📁 Estrutura do Projeto

```
ferias-system/
├── index.html     # Aplicação principal
├── schema.sql     # Schema do banco de dados
└── README.md      # Documentação
```

## 🗄️ Banco de Dados

### Tabela `employees`
| Coluna | Tipo | Descrição |
|---|---|---|
| id | uuid | Chave primária |
| name | text | Nome do funcionário (único) |
| created_at | timestamptz | Data de cadastro |

### Tabela `vacation_requests`
| Coluna | Tipo | Descrição |
|---|---|---|
| id | uuid | Chave primária |
| employee_name | text | Nome do funcionário |
| start_date | date | Data de início |
| end_date | date | Data de término |
| days | integer | Quantidade de dias corridos |
| notes | text | Observações |
| created_at | timestamptz | Data da solicitação |

## 📖 Como Usar

1. Abra o `index.html` no navegador
2. Adicione funcionários no card **"Funcionários Cadastrados"**
3. Preencha o formulário de solicitação
4. Clique em **"Exportar Excel"** para baixar o relatório
