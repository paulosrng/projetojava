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

-- Tabela de Pedidos (relacionamento Cliente-Pacote)
CREATE TABLE Pedido (
    id INT AUTO_INCREMENT PRIMARY KEY,
    cliente_id INT NOT NULL,
    pacote_id INT NOT NULL,
    data_contratacao TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    data_viagem DATE,
    valor_total DECIMAL(10,2) NOT NULL,
    status ENUM('PENDENTE', 'CONFIRMADO', 'CANCELADO') DEFAULT 'PENDENTE',
    
    FOREIGN KEY (cliente_id) REFERENCES Cliente(id) ON DELETE RESTRICT,
    FOREIGN KEY (pacote_id) REFERENCES PacoteViagem(id) ON DELETE RESTRICT,
    
    CONSTRAINT chk_valor_total_positivo CHECK (valor_total > 0)
);

- Tabela de Serviços por Pedido (relacionamento Pedido-Serviço)
CREATE TABLE PedidoServico (
    pedido_id INT NOT NULL,
    servico_id INT NOT NULL,
    quantidade INT NOT NULL DEFAULT 1,
    preco_unitario DECIMAL(10,2) NOT NULL,
    
    PRIMARY KEY (pedido_id, servico_id),
    FOREIGN KEY (pedido_id) REFERENCES Pedido(id) ON DELETE CASCADE,
    FOREIGN KEY (servico_id) REFERENCES ServicoAdicional(id) ON DELETE RESTRICT,
    
    CONSTRAINT chk_quantidade_positiva CHECK (quantidade > 0),
    CONSTRAINT chk_preco_unitario_positivo CHECK (preco_unitario > 0)
);

-- Índices para melhorar performance
CREATE INDEX idx_cliente_nome ON Cliente(nome);
CREATE INDEX idx_cliente_tipo ON Cliente(tipo);
CREATE INDEX idx_pacote_destino ON PacoteViagem(destino);
CREATE INDEX idx_pacote_tipo ON PacoteViagem(tipo);
CREATE INDEX idx_pedido_cliente ON Pedido(cliente_id);
CREATE INDEX idx_pedido_data ON Pedido(data_viagem);