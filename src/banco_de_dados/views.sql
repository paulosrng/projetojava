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

-- View para pedidos detalhados
CREATE VIEW vw_pedidos_detalhados AS
SELECT 
    pe.id AS pedido_id,
    c.nome AS cliente_nome,
    c.tipo AS cliente_tipo,
    p.nome AS pacote_nome,
    p.destino,
    pe.data_contratacao,
    pe.data_viagem,
    pe.valor_total AS valor_pacote,
    COALESCE(SUM(ps.preco_unitario * ps.quantidade), 0) AS valor_servicos,
    (pe.valor_total + COALESCE(SUM(ps.preco_unitario * ps.quantidade), 0)) AS valor_total,
    pe.status
FROM Pedido pe
JOIN Cliente c ON pe.cliente_id = c.id
JOIN PacoteViagem p ON pe.pacote_id = p.id
LEFT JOIN PedidoServico ps ON pe.id = ps.pedido_id
GROUP BY pe.id;