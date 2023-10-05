CREATE TABLE IF NOT EXISTS Empresa (
    IDEmpresa INT PRIMARY KEY,
    Nome VARCHAR (255),
    Email VARCHAR (255),
    CNPJ VARCHAR (255),
    Telefone VARCHAR (255)
);

CREATE TABLE IF NOT EXISTS Produtos (
    IDProduto INT PRIMARY KEY,
    Nome VARCHAR(255),
    Preco DECIMAL(10, 2),
    Quantidade VARCHAR(255),
    Estoque INT NOT NULL,
    FOREIGN KEY (IDProduto) REFERENCES Empresa(IDEmpresa)
);

CREATE TABLE IF NOT EXISTS Clientes (
    IDCliente INT PRIMARY KEY,
    Nome VARCHAR(255),
    Telefone VARCHAR(255)
);

CREATE TABLE IF NOT EXISTS Funcionarios (
    IDFuncionario INT PRIMARY KEY,
    Nome VARCHAR(255),
    Cargo VARCHAR(50),
    Salario DECIMAL (10, 2),
    FOREIGN KEY (IDFuncionario) REFERENCES Empresa(IDEmpresa)
);

CREATE TABLE IF NOT EXISTS Rendimento (
    IDRendimento INT PRIMARY KEY,
    Hora TIME,
    Venda DECIMAL (10, 2),
    RendaTotal DECIMAL (10, 2) FOREIGN KEY (IDRendimento) REFERENCES Empresa(IDEmpresa)
)