# README

## Financial and stock control app for a small business

Maria Bonita Cosméticos was developed to meet the needs of a small business, all the records are separate by month. The functionalities are:

### Produtos (Products):

* register of products and prices;

### Contabilidade (Accounting):

* **Finanças Diárias:** records of incomes and expenses, with reports and month balance;

* **Entradas Diárias:** records of daily incomes, in cash, debit card and credit card, with reports;

* **Pedidos e Pagamentos:** records of orders and payments to make;

* **Notas Fiscais:** records of the invoices;

* **Controle Bancário:** records of bank transactions and month balance;

* **Gráficos:** charts based on Entradas Diárias, with monthly incomes in cash, debit card, credit card and the total of monthly sales;

* **Fornecedores:** register of suppliers;

## Requeriments

* Ruby version: 2.5.0

* Rails version: 5.2.1

## Set up the app

After downloading the repository:

    $ cd maria-bonita-cosmeticos
    $ bundle install
    $ rails db:create db:migrate db:seed
    $ rails 'user:login[email, password, password_confirmation]'
    $ rails s
