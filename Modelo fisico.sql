CREATE TABLE IF NOT EXISTS Empresa (
    IDEmpresa INT PRIMARY KEY,
    Nome VARCHAR (255),
    CNPJ VARCHAR (255),
    Telefone VARCHAR (255),
    FOREIGN KEY (IDProduto) REFERENCES Produtos(IDProduto)
);
CREATE TABLE IF NOT EXISTS Produtos (
    IDProduto INT PRIMARY KEY,
    Nome VARCHAR(255),
    Preco DECIMAL(10, 2),
    Estoque INT,
    FOREIGN KEY (IDProduto) REFERENCES Empresa(IDEmpresa)
);
CREATE TABLE IF NOT EXISTS Clientes (
    IDCliente INT PRIMARY KEY,
    Nome VARCHAR(255),
    Telefone VARCHAR(255),
    FOREIGN KEY (IDCliente) REFERENCES Empresa(IDEmpresa)
);
CREATE TABLE IF NOT EXISTS Funcionarios (
    IDFuncionario INT PRIMARY KEY,
    Nome VARCHAR(255),
    Cargo VARCHAR(50),
    Salario DECIMAL (10, 2),
    FOREIGN KEY (IDFuncionario) REFERENCES Empresa(IDEmpresa)
);
CREATE TABLE IF NOT EXISTS Fornecedores (
    IDFornecedor INT PRIMARY KEY,
    Nome VARCHAR(255),
    CNPJ VARCHAR(20),
    Endereço VARCHAR(255),
    Telefone VARCHAR(15),
    FOREIGN KEY (IDFornecedor) REFERENCES Empresa(IDEmpresa)
);
CREATE TABLE IF NOT EXISTS Entregas (
    IDEntrega INT PRIMARY KEY,
    IDFornecedor INT,
    DataEntrega DATE,
    ValorTotal DECIMAL(10, 2),
    FOREIGN KEY (IDEntrega) REFERENCES Empresa(IDEmpresa),
    FOREIGN KEY (IDFornecedor) REFERENCES Fornecedores(IDFornecedor)
);
CREATE TABLE IF NOT EXISTS Vendas (
    IDVenda INT PRIMARY KEY,
    Data DATE,
    IDCliente INT,
    IDFuncionario INT,
    FOREIGN KEY (IDCliente) REFERENCES Clientes(IDCliente),
    FOREIGN KEY (IDFuncionario) REFERENCES Funcionarios(IDFuncionario),
    FOREIGN KEY (IDVenda) REFERENCES Empresa(IDEmpresa)
);