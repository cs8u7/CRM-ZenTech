-- Create schema
CREATE SCHEMA IF NOT EXISTS mkt_final;

-- Drop existing tables (if needed)
DROP TABLE IF EXISTS mkt_final.employees_tasks;
DROP TABLE IF EXISTS mkt_final.orders;
DROP TABLE IF EXISTS mkt_final.accounts;
DROP TABLE IF EXISTS mkt_final.products;
DROP TABLE IF EXISTS mkt_final.employees;
DROP TABLE IF EXISTS mkt_final.tasks;
DROP TABLE IF EXISTS mkt_final.sales_teams;

-- Create tables
-- 1. Products Table
CREATE TABLE mkt_final.products (
    product_id SERIAL PRIMARY KEY,
    product_name VARCHAR(255) NOT NULL,
    product_sale_price NUMERIC NOT NULL
);

-- 2. Sales Teams Table
CREATE TABLE mkt_final.sales_teams (
    sales_team_id SERIAL PRIMARY KEY,
    sales_team_manager_id INTEGER
);

-- 3. Employees Table
CREATE TABLE mkt_final.employees (
    employee_id SERIAL PRIMARY KEY,
    employee_name VARCHAR(255) NOT NULL,
    employee_email VARCHAR(255) UNIQUE NOT NULL,
    manager_id INTEGER REFERENCES mkt_final.employees(employee_id),
    regional_office VARCHAR(255),
    employee_status VARCHAR(50),
    sales_team_id INTEGER REFERENCES mkt_final.sales_teams(sales_team_id)
);

-- 4. Tasks Table
CREATE TABLE mkt_final.tasks (
    task_id SERIAL PRIMARY KEY,
    task_description TEXT NOT NULL,
    task_assigned_to INTEGER,
    task_completed BOOLEAN DEFAULT FALSE
);

-- 5. Accounts Table
CREATE TABLE mkt_final.accounts (
    account_id SERIAL PRIMARY KEY,
    account_name VARCHAR(255) UNIQUE NOT NULL,
    account_revenue NUMERIC,
    account_employees INTEGER,
    account_email VARCHAR(255),
    sales_team_id INTEGER REFERENCES mkt_final.sales_teams(sales_team_id),
    account_location_intl BOOLEAN
);

-- 6. Orders Table
CREATE TABLE mkt_final.orders (
    order_id SERIAL PRIMARY KEY,
    account_id INTEGER REFERENCES mkt_final.accounts(account_id),
    product_id INTEGER REFERENCES mkt_final.products(product_id),
    sale_agent_id INTEGER REFERENCES mkt_final.employees(employee_id),
    order_value NUMERIC NOT NULL,
    order_date DATE NOT NULL
);

-- 7. Employees_Tasks (Junction Table)
CREATE TABLE mkt_final.employees_tasks (
    task_id INTEGER REFERENCES mkt_final.tasks(task_id),
    employee_id INTEGER REFERENCES mkt_final.employees(employee_id),
    PRIMARY KEY (task_id, employee_id)
);

-- Example: Add comments for clarity
COMMENT ON TABLE mkt_final.products IS 'Stores product details, including pricing.';
COMMENT ON TABLE mkt_final.sales_teams IS 'Holds information about sales teams and their managers.';
COMMENT ON TABLE mkt_final.employees IS 'Details about employees, their hierarchy, and team affiliations.';
COMMENT ON TABLE mkt_final.tasks IS 'Tracks tasks and their completion status.';
COMMENT ON TABLE mkt_final.accounts IS 'Represents customer accounts and associated details.';
COMMENT ON TABLE mkt_final.orders IS 'Stores information about customer orders.';
COMMENT ON TABLE mkt_final.employees_tasks IS 'Junction table linking tasks to employees.';

