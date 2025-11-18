CREATE TABLE Fornecedores (
    FornecedorID INT PRIMARY KEY,
    NomeEmpresa VARCHAR(100) NOT NULL,
    CNPJ VARCHAR(18) NOT NULL,
    TelefoneContato VARCHAR(20),
    Email VARCHAR(100)
);

CREATE TABLE Componentes (
    ComponenteID INT PRIMARY KEY,
    FornecedorID INT NOT NULL,
    Nome VARCHAR(100) NOT NULL,
    Categoria VARCHAR(50) NOT NULL,
    PrecoVenda DECIMAL(10, 2) NOT NULL,
    CustoCompra DECIMAL(10, 2) NOT NULL,
    EstoqueAtual INT,    
    FOREIGN KEY (FornecedorID) REFERENCES Fornecedores(FornecedorID)
);

CREATE TABLE Tecnicos (
    TecnicoID INT PRIMARY KEY,
    Nome VARCHAR(100) NOT NULL,
    Especialidade VARCHAR(50),
    DataContratacao DATE,
    SalarioBase DECIMAL(10, 2)
);

CREATE TABLE ServicosReparo (
    ServicoID INT PRIMARY KEY,
    TecnicoID INT,
    ClienteNome VARCHAR(100) NOT NULL,
    DescricaoProblema TEXT,
    DataEntrada DATETIME NOT NULL,
    DataConclusaoPrevista DATE,
    CustoPecas DECIMAL(10, 2) DEFAULT 0.00,
    MaoDeObra DECIMAL(10, 2) NOT NULL,
    Status VARCHAR(50) NOT NULL,
    
    FOREIGN KEY (TecnicoID) REFERENCES Tecnicos(TecnicoID)
);
