﻿using MercadoDominio.Entidades;
using MercadoDominio.Interfaces;
using MercadoRepositorioADO.Extensoes;
using System.Collections.Generic;

namespace MercadoRepositorioADO.Repositorios
{
    public class ProdutoRepositorioADO : IProdutoRepositorio
    {
        private Contexto.Contexto contexto;

        private void Insert(Produto produto)
        {
            using (contexto = new Contexto.Contexto())
            {
                var cmd = contexto.ExecutaComando("InsereProduto");
                cmd.Parameters.AddWithValue("@Nome", produto.Nome);
                cmd.Parameters.AddWithValue("@Valor", produto.Valor);
                cmd.Parameters.AddWithValue("@Fabricante", produto.IdFabricante);
                cmd.Parameters.AddWithValue("@Distribuidor", produto.IdDistribuidor);
                cmd.Parameters.AddWithValue("@Imagem", produto.Imagem);
                cmd.ExecuteNonQuery();
            }
        }

        private void Alterar(Produto produto)
        {
            using (contexto = new Contexto.Contexto())
            {
                var cmd = contexto.ExecutaComando("AlteraProduto");
                cmd.Parameters.AddWithValue("@Id", produto.Id);
                cmd.Parameters.AddWithValue("@Nome", produto.Nome);
                cmd.Parameters.AddWithValue("@Valor", produto.Valor);
                cmd.Parameters.AddWithValue("@Fabricante", produto.IdFabricante);
                cmd.Parameters.AddWithValue("@Distribuidor", produto.IdDistribuidor);
                cmd.Parameters.AddWithValue("@Imagem", produto.Imagem);
                cmd.ExecuteNonQuery();
            }
        }

        public void Salvar(Produto produto)
        {
            if (produto.Id > 0)
                Alterar(produto);
            else
                Insert(produto);
        }

        public void Excluir(Produto produto)
        {
            using (contexto = new Contexto.Contexto())
            {
                var cmd = contexto.ExecutaComando("ExcluiProduto");
                cmd.Parameters.AddWithValue("@Id", produto.Id);
                cmd.ExecuteNonQuery();
            }
        }

        public IEnumerable<Produto> ListarTodos()
        {
            using (contexto = new Contexto.Contexto())
            {
                var cmd = contexto.ExecutaComando("ListaProdutos");
                var produtos = new List<Produto>();

                using (var reader = cmd.ExecuteReader())
                    while (reader.Read())
                        produtos.Add(new Produto()
                        {
                            Id = reader.ReadAsInt("Id"),
                            Nome = reader.ReadAsString("Nome"),
                            Valor = reader.ReadAsDecimal("Valor"),
                            Fabricante = new Fabricante
                            {
                                Nome = reader.ReadAsString("nFabricante")
                            },
                            Distribuidor = new Distribuidor
                            {
                                Nome = reader.ReadAsString("nDistribuidor")
                            }
                        });

                return produtos;
            }
        }

        public Produto ListarPorId(int id)
        {
            using (contexto = new Contexto.Contexto())
            {
                var cmd = contexto.ExecutaComando("ListaProdutoPorId");
                cmd.Parameters.AddWithValue("@Id", id);

                using (var reader = cmd.ExecuteReader())
                    if (reader.Read())
                        return new Produto
                        {
                            Id = reader.ReadAsInt("Id"),
                            Nome = reader.ReadAsString("Nome"),
                            IdFabricante = reader.ReadAsInt("Fabricante"),
                            IdDistribuidor = reader.ReadAsInt("Distribuidor"),
                            Valor = reader.ReadAsDecimal("Valor"),
                            Fabricante = new Fabricante
                            {
                                Nome = reader.ReadAsString("NomeFabricante")
                            },
                            Distribuidor = new Distribuidor
                            {
                                Nome = reader.ReadAsString("NomeDistribuidor")
                            },
                            Imagem = reader.ReadAsString("Imagem")
                        };

                return null;
            }
        }

        public int VerificaExistenciaSimilar(Produto produto)
        {
            using (contexto = new Contexto.Contexto())
            {
                var cmd = contexto.ExecutaComando("VerificaProdutoIgual");
                cmd.Parameters.AddWithValue("@nome", produto.Nome);
                cmd.Parameters.AddWithValue("@idFabricante", produto.IdFabricante);
                cmd.Parameters.AddWithValue("@idProduto",produto.Id);

                using (var reader = cmd.ExecuteReader())
                    while (reader.Read())
                        return 1;
                    
                return 0;
            }
        }

        public IEnumerable<Produto> ListarProdutosForaEstoque()
        {
            using (contexto = new Contexto.Contexto())
            {
                var cmd = contexto.ExecutaComando("listaProdutosForaEstoque");
                var produtos = new List<Produto>();

                using (var reader = cmd.ExecuteReader())
                    while (reader.Read())
                        produtos.Add(new Produto()
                        {
                            Id = reader.ReadAsInt("Id"),
                            Nome = reader.ReadAsString("Nome"),
                        });

                return produtos;
            }
        }
    }
}
