CREATE TABLE Dono_do_mercado (
   Id_Dono (PK),
   Nome VARCHAR(255),
   Telefone VARCHAR(255),
   Cpf VARCHAR(50) 
);

CREATE TABLE Produtos (
   Id_Produto (PK),
   Preco DECIMAL
);

CREATE TABLE Cliente (
   Id_Cliente (PK),
   Nome VARCHAR (255)
);

CREATE TABLE Vende (
    Id_Produto (PK),
    Id_Dono (FK),
    Produtos VARCHAR (255)
);

CREATE TABLE Compra (
    Id_Compra (PK),
    Id_Cliente INT (FK),
    Id_Produto INT (FK),
    Quantidade DECIMAL,
    Preco_Total DECIMAL
);




