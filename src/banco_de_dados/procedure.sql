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

