# 🖥️ TecnoFix — Sistema de Gestão de Reparos e Componentes

## 📝 Visão Geral do Projeto
O **TecnoFix** é um projeto de Banco de Dados Relacional em SQL desenvolvido para gerenciar uma loja fictícia de serviços de tecnologia. Seu foco está na gestão de inventário de peças e no controle de serviços de reparo.

O sistema possibilita o rastreamento de:

- **Componentes:** itens de hardware, preços e custos.
- **Fornecedores:** empresas que fornecem os componentes.
- **Técnicos:** responsáveis pelas manutenções.
- **Serviços de Reparo:** histórico completo dos atendimentos realizados.

---

## 🎯 Objetivo e Aprendizado
O principal objetivo é aplicar os comandos SQL na modelagem de um negócio realista, envolvendo estoque e serviços técnicos.

---

## 📌 Aprendizados Chave

- **Modelagem de Relacionamentos:** uso de foreign keys para conectar tabelas como Componentes → Fornecedores e ServicosReparo → Tecnicos.
- **DDL vs DML:** diferenciação entre definição de estrutura (DDL) e manipulação de dados (DML).

---

## 🛠️ Como Executar o Script SQL

### ✔️ Pré-requisitos
Um SGBD compatível com SQL, como MySQL, PostgreSQL, SQL Server etc.

### ✔️ Passos
1. Copie o script completo abaixo.
2. Cole em sua ferramenta SQL (Workbench, DBeaver, etc.).
3. Execute para criar e popular as tabelas.

---

## 💾 Script SQL Completo (DDL + DML)

```sql
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
    CustoPecas DECIMAL(10, 2),
    MaoDeObra DECIMAL(10, 2) NOT NULL,
    Status VARCHAR(50) NOT NULL,
    FOREIGN KEY (TecnicoID) REFERENCES Tecnicos(TecnicoID)
);

📚 Guia Educacional: DDL e DML
🧱 DDL — Data Definition Language

Comandos que definem a estrutura do banco.

CREATE — cria objetos.

ALTER — altera tabelas.

DROP — remove objetos.

📄 DML — Data Manipulation Language

Comandos que manipulam registros.

INSERT — adiciona dados.

UPDATE — altera dados.

DELETE — exclui dados.

SELECT — consulta (DQL).
