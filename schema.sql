-- Drop existing tables if they exist
DROP TABLE IF EXISTS employees_tasks;
DROP TABLE IF EXISTS tasks;
DROP TABLE IF EXISTS orders;
DROP TABLE IF EXISTS accounts;
DROP TABLE IF EXISTS employees;
DROP TABLE IF EXISTS products;
DROP TABLE IF EXISTS sales_teams;

-- Sales Teams Table
CREATE TABLE sales_teams (
    sales_team_id INT PRIMARY KEY,
    manager VARCHAR(255),
    regional_office VARCHAR(255),
    manager_status VARCHAR(50)
);

-- Employees Table
CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    employee_name VARCHAR(255) NOT NULL,
    employee_email VARCHAR(255) UNIQUE NOT NULL,
    regional_office VARCHAR(255),
    employee_status VARCHAR(50),
    sales_team_id INT,
    FOREIGN KEY (manager_id) REFERENCES employees(employee_id) ON DELETE SET NULL ON UPDATE CASCADE,
    FOREIGN KEY (sales_team_id) REFERENCES sales_teams(sales_team_id) ON DELETE SET NULL ON UPDATE CASCADE
);

-- Products Table
CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(255) NOT NULL,
    product_sale_price DECIMAL(10, 2) NOT NULL
);

-- Accounts Table
CREATE TABLE accounts (
    account_id INT PRIMARY KEY,
    account_name VARCHAR(255) UNIQUE NOT NULL,
    account_revenue DECIMAL(15, 2),
    account_employees INT,
    account_email VARCHAR(255),
    sales_team_id INT,
    account_location_intl VARCHAR(255),
    FOREIGN KEY (sales_team_id) REFERENCES sales_teams(sales_team_id) ON DELETE SET NULL ON UPDATE CASCADE
);

-- Orders Table
CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    account_name VARCHAR(255) NOT NULL,
    product_name VARCHAR(255) NOT NULL,
    sale_agent_name VARCHAR(255) NOT NULL,
    order_value DECIMAL(15, 2),
    order_date DATE,
    FOREIGN KEY (account_name) REFERENCES accounts(account_name) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (product_name) REFERENCES products(product_name) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (sale_agent_name) REFERENCES employees(employee_name) ON DELETE CASCADE ON UPDATE CASCADE
);

-- Tasks Table
CREATE TABLE tasks (
    task_id INT PRIMARY KEY,
    task_description TEXT,
    task_assigned_to VARCHAR(255) NOT NULL,
    task_completed BOOLEAN DEFAULT FALSE
);

-- Employees_Tasks Table
CREATE TABLE employees_tasks (
    task_id INT NOT NULL,
    employee_id INT NOT NULL,
    PRIMARY KEY (task_id, employee_id),
    FOREIGN KEY (task_id) REFERENCES tasks(task_id) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (employee_id) REFERENCES employees(employee_id) ON DELETE CASCADE ON UPDATE CASCADE
);
