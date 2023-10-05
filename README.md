# DataBase_livraria_MySql
# Projeto de Banco de Dados em MySQL

Este projeto envolve a criação de tabelas para gerenciar informações sobre livros, estoque, vendas e vendedores em um banco de dados MySQL. Abaixo estão listadas as instruções SQL utilizadas no projeto:

1. **Criação das Tabelas:**
   - `LIVROS`, `ESTOQUE`, `VENDAS`, `VENDEDORES`

2. **Alteração da Chave Estrangeira:**
   - A tabela `ESTOQUE` foi alterada para referenciar a chave primária `ID_LIVRO` da tabela `LIVROS`.

3. **Desativar Verificação de Chaves Estrangeiras**

4. **Inserção de Dados:**
   - Inserção de registros nas tabelas `LIVROS`, `VENDEDORES`, `VENDAS` e `ESTOQUE`.

5. **Inserção de Dados Fora de Ordem:**
   - Inserção de registros na tabela `LIVROS` com dados fora da ordem original.

6. **Consulta de Registros:**
   - Seleção de todos os registros na tabela `LIVROS`.
   - Seleção de campos específicos renomeados.

7. **Filtragem de Dados:**
   - Seleção de livros da categoria "Biografia".
   - Seleção de romances com preço menor que R$ 48,00.
   - Seleção de poesias de autores diferentes de Luís Vaz de Camões e Gabriel Pedrosa.

8. **Consulta Distinta:**
   - Seleção de IDs de livros distintos das vendas feitas por um vendedor específico.

9. **Exclusão de Registros:**
   - Remoção de um livro específico da tabela `LIVROS`.

10. **Atualização de Registros:**
    - Atualização dos preços dos livros.

11. **Agrupamento de Dados:**
    - Contagem das vendas por vendedor.

12. **Junção de Tabelas:**
    - União das tabelas `VENDAS` e `VENDEDORES` para obter o total de vendas por vendedor.

13. **Maior Venda:**
    - Identificação da maior venda.

14. **Maior Venda por Vendedor:**
    - Identificação da maior venda por vendedor.

15. **Consulta com Left Join:**
    - Obtenção dos livros que não foram vendidos.

16. **Consulta com Right Join:**
    - Obtenção dos registros de vendas que têm correspondência em `LIVROS`.

---

Lembre-se de adaptar os comandos e consultas conforme as necessidades específicas do seu projeto. Fique à vontade para contribuir.
