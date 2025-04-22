CREATE DATABASE IF NOT EXISTS agencia_viagens;
USE agencia_viagens;

-- Tabela de Clientes 
CREATE TABLE Cliente (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    telefone VARCHAR(20) NOT NULL,
    email VARCHAR(100) NOT NULL,
    cpf VARCHAR(14),
    passaporte VARCHAR(20),
    tipo ENUM('NACIONAL', 'ESTRANGEIRO') NOT NULL,
    data_cadastro TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    
  
    CONSTRAINT chk_documento CHECK (
        (tipo = 'NACIONAL' AND cpf IS NOT NULL AND passaporte IS NULL) OR
        (tipo = 'ESTRANGEIRO' AND passaporte IS NOT NULL AND cpf IS NULL)
    ),
    
  
    CONSTRAINT uk_cpf UNIQUE (cpf),
    CONSTRAINT uk_passaporte UNIQUE (passaporte)
);

-- Tabela de Pacotes de Viagem
CREATE TABLE PacoteViagem (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    destino VARCHAR(100) NOT NULL,
    duracao INT NOT NULL,
    preco DECIMAL(10,2) NOT NULL,
    tipo VARCHAR(50) NOT NULL,
    ativo BOOLEAN DEFAULT TRUE,
    
    CONSTRAINT chk_preco_positivo CHECK (preco > 0)
);

-- Tabela de Serviços Adicionais
CREATE TABLE ServicoAdicional (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    preco DECIMAL(10,2) NOT NULL,
    descricao TEXT,
    ativo BOOLEAN DEFAULT TRUE,
    
    CONSTRAINT chk_preco_servico_positivo CHECK (preco > 0)
);