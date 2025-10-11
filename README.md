# README

## Financial and stock control app for a small business

Maria Bonita Cosméticos was developed to meet the needs of a small business, all the records are separate by month. The functionalities are:

### Produtos (Products):

- register of products and prices;

### Contabilidade (Accounting):

- **Finanças Diárias:** records of incomes and expenses, with reports and month balance;

- **Entradas Diárias:** records of daily incomes, in cash, debit card and credit card, with reports;

- **Pedidos e Pagamentos:** records of orders and payments to make;

- **Notas Fiscais:** records of the invoices;

- **Controle Bancário:** records of bank transactions and month balance;

- **Gráficos:** charts based on Entradas Diárias, with monthly incomes in cash, debit card, credit card and the total of monthly sales;

- **Fornecedores:** register of suppliers;

## 📋 Requirements

- Ruby version: **3.3.7**
- Rails version: **~> 8.0**
- PostgreSQL: **16** (via Docker)
- Bundler: **2.6.5**

## 🚀 Setup

### Quick Installation with Docker

This project uses Docker to run PostgreSQL, without the need for local database installation.

1. **Install project dependencies:**

   ```bash
   cd maria-bonita-cosmeticos
   bundle install
   ```

2. **Start PostgreSQL via Docker:**

   ```bash
   # Make sure Docker is running
   docker-compose up -d
   ```

3. **Setup the database:**

   ```bash
   bin/rails db:create db:migrate db:seed
   ```

4. **Create your user:**

   ```bash
   bin/rails 'user:login[email, password, password_confirmation]'
   ```

5. **Start the server:**

   ```bash
   bin/rails server
   ```

Access: http://localhost:3000
