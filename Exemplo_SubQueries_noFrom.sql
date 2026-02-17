--subqueries no from
SELECT 

*

FROM 
    (
        SELECT 
            B1.B1_COD AS PRODUTO,
            B1.B1_DESC AS DESCRICAO,
            SUM(C6_QTDVEN) AS QTDVEN
        FROM 
            SB1010 B1
            LEFT JOIN SC6010 C6 ON(
                C6_FILIAL = '09ALFA01'
                AND C6.C6_PRODUTO = B1.B1_COD
                AND C6.D_E_L_E_T_=''
            )
        WHERE 
            B1.B1_FILIAL = '09ALFA'
            AND B1.D_E_L_E_T_=''
        GROUP BY 
            B1.B1_COD,
            B1.B1_DESC
    )as TAB_TEMP
    
WHERE 
    TAB_TEMP.QTDVEN > 0

ORDER BY 
PRODUTO