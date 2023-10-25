CREATE TABLE
    IF NOT EXISTS empresa (
        ID_empresa INT AUTO_INCREMENT PRIMARY KEY,
        Nome VARCHAR(255) NULL,
        Email VARCHAR(255) NOT NULL,
        Senha VARCHAR(32) NOT NULL,
        Telefone VARCHAR(255) NOT NULL
    );

CREATE TABLE
    IF NOT EXISTS cadastro (
        ID_cadastro INT AUTO_INCREMENT PRIMARY KEY,
        Email VARCHAR(255) NOT NULL,
        Senha VARCHAR(32) NOT NULL,
        Cpf VARCHAR(11) NOT NULL
    )

CREATE TABLE
    IF NOT EXISTS produtos (
        ID_Produto INT AUTO_INCREMENT PRIMARY KEY,
        Nome VARCHAR(255) NULL,
        Preco DECIMAL(10, 2) NULL,
        Quantidade VARCHAR(255) NULL,
        ID_empresa INT,
        FOREIGN KEY (ID_empresa) REFERENCES empresa(ID_empresa)
    );

CREATE TABLE
    IF NOT EXISTS clientes (
        ID_Cliente INT PRIMARY KEY,
        Nome VARCHAR(255),
        Telefone VARCHAR(255)
    );

CREATE TABLE
    IF NOT EXISTS funcionarios (
        ID_Funcionario INT PRIMARY KEY,
        Nome VARCHAR(255),
        Cargo VARCHAR(50),
        Salario DECIMAL (10, 2),
        FOREIGN KEY (IDFuncionario) REFERENCES empresa(ID_empresa)
    );

CREATE TABLE
    IF NOT EXISTS rendimento (
        ID_Rendimento INT PRIMARY KEY,
        Hora TIME,
        Venda DECIMAL (10, 2),
        RendaTotal DECIMAL (10, 2) FOREIGN KEY (IDRendimento) REFERENCES empresa(ID_empresa)
    )