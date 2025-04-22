-- View para clientes completos
CREATE VIEW vw_clientes_completos AS
SELECT 
    id, nome, telefone, email, tipo,
    COALESCE(cpf, passaporte) AS documento,
    data_cadastro
FROM Cliente;

-- View para pacotes com status
CREATE VIEW vw_pacotes_com_status AS
SELECT 
    p.id, p.nome, p.destino, p.duracao, p.preco, p.tipo,
    CASE WHEN COUNT(pe.id) > 0 THEN 'COM_PEDIDOS' ELSE 'SEM_PEDIDOS' END AS status
FROM PacoteViagem p
LEFT JOIN Pedido pe ON p.id = pe.pacote_id
GROUP BY p.id;