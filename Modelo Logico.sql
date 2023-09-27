

CREATE TABLE Dono_do_mercado (
    Id_Dono  ,
    Nome ,
    Telefone ,
    Cpf 
);

CREATE TABLE Produtos (
    Id_Produto ,
    Preco ,
    Descricao 
);

CREATE TABLE Cliente (
    Id_Cliente ,
    Nome 
);

CREATE TABLE Vende (
    Id_Produto ,
    Preco 
);

CREATE TABLE Compra (
    Id_Compra ,
    Id_Cliente ,
    Id_Produto  ,
    Quantidade  ,
    Preco_Total 
);