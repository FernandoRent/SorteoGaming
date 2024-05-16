create view conduceygana as(
	select usuario.usuario_id, ciudad, estado, fecha_nacimiento, puntos, fecha_inicio, puntos_ganados from usuario
	inner join puntos on puntos.usuario_id=usuario.usuario_id
    inner join game_conduceygana on usuario.usuario_id=game_conduceygana.usuario_id);
    
create view othergames as(
	select usuario.usuario_id, ciudad, estado, fecha_nacimiento, multiplicador, resultado, fecha_hora from usuario
	inner join apuestas on apuestas.usuario_id=usuario.usuario_id);
    
CREATE VIEW deposito_view AS
SELECT *
FROM transaccion
WHERE tipo_transaccion = 'Deposito';


CREATE VIEW transaccion_spend_view AS
SELECT *
FROM transaccion
WHERE tipo_transaccion in ('Apuesta','Vidas');


create view ingresos as 
select usuario_id, fecha_transaccion, importe from transaccion 
where tipo_transaccion in ('WinLoss');

    