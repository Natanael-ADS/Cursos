UPDATE Produto SET ValorVenda_Produto = CASE 
    WHEN UndMedida_produto = 'CX'
        THEN ROUND(ValorVenda_Produto*0.75,2)
    WHEN UndMedida_produto = 'PCT'
        THEN ROUND(ValorVenda_Produto*0.95,2)
    ELSE
        ValorVenda_Produto+0.1
END