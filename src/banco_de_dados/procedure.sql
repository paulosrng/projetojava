-- Procedure para cadastrar cliente
DELIMITER //
CREATE PROCEDURE sp_cadastrar_cliente(
    IN p_nome VARCHAR(100),
    IN p_telefone VARCHAR(20),
    IN p_email VARCHAR(100),
    IN p_tipo ENUM('NACIONAL', 'ESTRANGEIRO'),
    IN p_documento VARCHAR(20)
)
BEGIN
    IF p_tipo = 'NACIONAL' THEN
        INSERT INTO Cliente (nome, telefone, email, cpf, passaporte, tipo)
        VALUES (p_nome, p_telefone, p_email, p_documento, NULL, p_tipo);
    ELSE
        INSERT INTO Cliente (nome, telefone, email, cpf, passaporte, tipo)
        VALUES (p_nome, p_telefone, p_email, NULL, p_documento, p_tipo);
    END IF;
END //
DELIMITER ;

-- Procedure para criar um novo pedido com serviços
DELIMITER //
CREATE PROCEDURE sp_criar_pedido(
    IN p_cliente_id INT,
    IN p_pacote_id INT,
    IN p_data_viagem DATE,
    IN p_servicos_json JSON
)
BEGIN
    DECLARE v_pacote_preco DECIMAL(10,2);
    DECLARE v_pedido_id INT;
    DECLARE i INT DEFAULT 0;
    DECLARE v_servico_id INT;
    DECLARE v_quantidade INT;
    
    -- Obter preço do pacote
    SELECT preco INTO v_pacote_preco FROM PacoteViagem WHERE id = p_pacote_id;
    
    -- Criar o pedido
    INSERT INTO Pedido (cliente_id, pacote_id, data_viagem, valor_total, status)
    VALUES (p_cliente_id, p_pacote_id, p_data_viagem, v_pacote_preco, 'PENDENTE');
    
    SET v_pedido_id = LAST_INSERT_ID();