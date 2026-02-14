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
- SQLite: **3.51+** (built-in with Rails 8)
- Bundler: **2.6.5**

## 🚀 Setup

### Quick Installation

This project uses SQLite, which comes built-in with Rails 8 - no external database installation needed.

1. **Install project dependencies:**

   ```bash
   cd maria-bonita-cosmeticos
   bundle install
   ```

2. **Setup database:**

   ```bash
   bin/rails db:create db:migrate db:seed
   ```

3. **Create your user:**

   ```bash
   bin/rails 'user:login[email, password, password_confirmation]'
   ```

4. **Start server:**

   ```bash
   bin/rails server
   ```

Access: http://localhost:3000
