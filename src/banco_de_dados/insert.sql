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

