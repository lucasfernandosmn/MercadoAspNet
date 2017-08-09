﻿using Mercado.Dominio.Contrato;
using System.Linq;
using Mercado.Dominio;
using System.Collections.Generic;
using System.Data.SqlClient;

namespace Mercado.RepositorioADO
{
    public class EstoqueRepositorioADO : IRepositorio<Estoque>
    {
        private Contexto contexto;

        private void Insert(Estoque estoque)
        {
            var strQuery = "";
            strQuery += " INSERT INTO DBEstoque(IdProduto,Quantidade)";
            strQuery += $" VALUES('{estoque.IdProduto}','{estoque.Quantidade}')";

            using (contexto = new Contexto())
            {
                contexto.ExecutaComando(strQuery);
            }
        }

        private void Alterar(Estoque estoque)
        {
            var strQuery = "";
            strQuery += " UPDATE DBEstoque SET " +
                         $" Quantidade = '{estoque.Quantidade}' " +
                         $" WHERE IdProduto = {estoque.IdProduto}";
            using (contexto = new Contexto())
            {
                contexto.ExecutaComando(strQuery);
            }
        }

        public void Salvar(Estoque estoque)
        {
          if(estoque.IdProduto > 0)
          {
            Alterar(estoque);
          }
          else
          {
            Insert(estoque);
          }
        }

        public void Excluir(Estoque estoque)
        {
            using (contexto = new Contexto())
            {
                var strQuery = string.Format("DELETE FROM DBEstoque WHERE IdProduto = '{0}'", estoque.IdProduto);
                contexto.ExecutaComando(strQuery);
            }
        }

        public IEnumerable<Estoque> ListarTodos()
        {
            using (contexto = new Contexto())
            {
                var strQuery = " select p.id as 'IdProduto', p.Nome as 'Nome', d.Nome as 'Distribuidor', " +
                               $" f.Nome as 'Fabricante', e.Quantidade from DBProdutos p " +
                               $" inner join DBEstoque e on e.IdProduto = p.Id" +
                               $" inner join DBFabricantes f on f.Id = p.Fabricante" +
                               $" inner join DBDistribuidores d on d.Id = p.Distribuidor";
                var estoques = new List<Estoque>();
                using (var reader = contexto.ExecutaComandoComRetorno(strQuery))
                    while (reader.Read())
                        estoques.Add(new Estoque()
                        {
                            IdProduto = reader.ReadAsInt("IdProduto"),
                            Produto = new Produto
                            {
                                Nome = reader.ReadAsString("Nome"),
                                Fabricante = new Fabricante
                                {
                                    Nome = reader.ReadAsString("Fabricante")
                                },
                                Distribuidor = new Distribuidor
                                {
                                    Nome = reader.ReadAsString("Distribuidor")
                                }
                            },
                            Quantidade = reader.ReadAsDecimal("Quantidade")
                        });

                return estoques;
            }
        }

        public Estoque ListarPorId(string id)
        {
            using (contexto = new Contexto())
            {
                var strQuery = string.Format(" SELECT * FROM DBEstoque WHERE IdProduto = {0}", id);
                var retornoDataReader = contexto.ExecutaComandoComRetorno(strQuery);
                return TransformaReaderEmListaDeObjeto(retornoDataReader).FirstOrDefault();
            }
        }

        private List<Estoque> TransformaReaderEmListaDeObjeto(SqlDataReader reader)
        {
            var estoques = new List<Estoque>();
            while (reader.Read())
            {
                var temObjeto = new Estoque()
                {
                    IdProduto = reader.ReadAsInt("IdProduto"),
                    Quantidade = reader.ReadAsDecimal("Quantidade")
                };
                estoques.Add(temObjeto);
            }

            reader.Close();
            return estoques;
        }
    }
}
