CREATE PROCEDURE sp_atualizarSalario(_ajusteSalario numeric, _codigoEmpregado smallint)
BEGIN
  update empregados as em set em.ajusteSalario = _ajusteSalario where em.codigo = _codigoEmpregado;
END;

call sp_atualizarSalario(500,3);