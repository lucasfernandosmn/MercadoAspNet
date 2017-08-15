﻿using Mercado.Dominio;
using Mercado.Dominio.Contrato;
using MercadoRepositorioADO.Extensoes;
using System.Collections.Generic;

namespace Mercado.RepositorioADO
{
    public class VendaRepositorioADO : IRepositorio<Venda>
    {
        private Contexto contexto;

        private void Insert(Venda venda)
        {
            using (contexto = new Contexto())
            {
                var cmd = contexto.ExecutaComando("InsereVenda");
                cmd.Parameters.AddWithValue("@IdProduto", venda.IdProduto);
                cmd.Parameters.AddWithValue("@Quantidade", venda.Quantidade);
                cmd.Parameters.AddWithValue("@IdFuncionario", venda.IdFuncionario);
                cmd.ExecuteNonQuery();
            }
        }

        private void Alterar(Venda venda)
        {
            using (contexto = new Contexto())
            {
                var cmd = contexto.ExecutaComando("AlteraVenda");
                cmd.Parameters.AddWithValue("@IdVenda", venda.IdVenda);
                cmd.Parameters.AddWithValue("@IdProduto", venda.IdProduto);
                cmd.Parameters.AddWithValue("@Quantidade", venda.Quantidade);
                cmd.Parameters.AddWithValue("@IdFuncionario", venda.IdFuncionario);
                cmd.ExecuteNonQuery();
            }
        }

        public void Salvar(Venda venda)
        {
            if (venda.IdVenda > 0)
                Alterar(venda);
            else
                Insert(venda);
        }

        public void Excluir(Venda venda)
        {
            using (contexto = new Contexto())
            {
                var cmd = contexto.ExecutaComando("ExcluirVenda");
                cmd.Parameters.AddWithValue("@Id", venda.IdVenda);
                cmd.ExecuteNonQuery();
            }
        }

        public IEnumerable<Venda> ListarTodos()
        {
            using (contexto = new Contexto())
            {
                var cmd = contexto.ExecutaComando("ListaVendas");
                var vendas = new List<Venda>();

                using (var reader = cmd.ExecuteReader())
                    while (reader.Read())
                        vendas.Add( new Venda()
                        {
                            IdVenda = reader.ReadAsInt("IdVenda"),
                            IdProduto = reader.ReadAsInt("IdProduto"),
                            IdFuncionario = reader.ReadAsInt("Funcionario"),
                            Produto = new Produto
                            {
                                Nome = reader.ReadAsString("Produto")
                            },
                            Quantidade = reader.ReadAsDecimal("Quantidade"),
                            Funcionario = new Usuario
                            {
                                Nome = reader.ReadAsString("FuncionarioNome")
                            }
                        });

                return vendas;
            }
        }

        public Venda ListarPorId(int id)
        {
            using (contexto = new Contexto())
            {
                var cmd = contexto.ExecutaComando("ListaVendaPorId");

                using (var reader = cmd.ExecuteReader())
                    if (reader.Read())
                        return new Venda
                        {
                            IdVenda = reader.ReadAsInt("IdVenda"),
                            IdProduto = reader.ReadAsInt("IdProduto"),
                            Quantidade = reader.ReadAsDecimal("Quantidade"),
                            IdFuncionario = reader.ReadAsInt("Funcionario"),
                            Produto = new Produto
                            {
                                Nome = reader.ReadAsString("Nome")
                            }
                        };

                return null;
            }
        }
    }
}