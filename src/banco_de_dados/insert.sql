-- Inserção de clientes
INSERT INTO Cliente (nome, telefone, email, cpf, passaporte, tipo) VALUES
('João Silva', '(11) 99999-9999', 'joao@email.com', '123.456.789-00', NULL, 'NACIONAL'),
('Maria Souza', '(21) 98888-8888', 'maria@email.com', '987.654.321-00', NULL, 'NACIONAL'),
('John Smith', '(44) 77777-7777', 'john@email.com', NULL, 'US12345678', 'ESTRANGEIRO');

-- Inserção de pacotes de viagem
INSERT INTO PacoteViagem (nome, destino, duracao, preco, tipo) VALUES
('Aventura na Amazônia', 'Manaus', 5, 3500.00, 'AVENTURA'),
('Luxo em Fernando de Noronha', 'Fernando de Noronha', 7, 12000.00, 'LUXO'),
('Tour Cultural Europa', 'Paris, Roma, Barcelona', 14, 25000.00, 'CULTURAL'),
('Lua de Mel Maldivas', 'Maldivas', 10, 30000.00, 'ROMANTICO');

-- Inserção de serviços adicionais
INSERT INTO ServicoAdicional (nome, preco, descricao) VALUES
('Translado Aeroporto', 150.00, 'Transporte privativo do aeroporto até o hotel'),
('Passeio de Helicóptero', 800.00, 'Passeio panorâmico de helicóptero'),
('Aluguel de Carro', 120.00, 'Carro econômico por dia'),
('Guia Turístico', 300.00, 'Guia especializado por dia');

-- Inserção de pedidos
INSERT INTO Pedido (cliente_id, pacote_id, data_viagem, valor_total, status) VALUES
(1, 1, '2023-12-15', 3500.00, 'CONFIRMADO'),
(2, 3, '2024-02-20', 25000.00, 'PENDENTE'),
(3, 4, '2024-06-01', 30000.00, 'CONFIRMADO');
