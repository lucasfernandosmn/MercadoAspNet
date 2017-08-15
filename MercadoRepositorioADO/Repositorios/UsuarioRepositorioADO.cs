﻿using Mercado.Dominio;
using Mercado.Dominio.Contrato;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;

namespace Mercado.RepositorioADO
{
    public class UsuarioRepositorioADO : IRepositorio<Usuario>
    {
        private Contexto contexto;

        private void Insert(Usuario usuario)
        {
            using (contexto = new Contexto())
            {
                var cmd = contexto.ExecutaComando("InsereUsuario");
                cmd.Parameters.AddWithValue("@Nome", usuario.Nome);
                cmd.Parameters.AddWithValue("@Nivel", usuario.Nivel);
                cmd.ExecuteNonQuery();
            }
        }

        private void Alterar(Usuario usuario)
        {
            using (contexto = new Contexto())
            {
                var cmd = contexto.ExecutaComando("InsereProduto");
                cmd.Parameters.AddWithValue("@Nome", produto.Nome);
                cmd.Parameters.AddWithValue("@Valor", produto.Valor);
                cmd.Parameters.AddWithValue("@Fabricante", produto.IdFabricante);
                cmd.ExecuteNonQuery();
            }
        }

        public void Salvar(Usuario usuario)
        {
            if (usuario.Id > 0)
                Alterar(usuario);
            else
                Insert(usuario);
        }

        public void Excluir(Usuario usuario)
        {
            using (contexto = new Contexto())
            {
                var strQuery = $"DELETE FROM DBUsuarios WHERE Id = '{usuario.Id}'";
                contexto.ExecutaComando(strQuery);
            }
        }

        public IEnumerable<Usuario> ListarTodos()
        {
            using (contexto = new Contexto())
            {
                var strQuery = " SELECT * FROM DBUsuarios";
                var retornoDataReader = contexto.ExecutaComandoComRetorno(strQuery);
                return TransformaReaderEmListaDeObjeto(retornoDataReader);
            }
        }

        public Usuario ListarPorId(int id)
        {
            using (contexto = new Contexto())
            {
                var strQuery = $" SELECT * FROM DBUsuarios WHERE Id = {id}";
                var retornoDataReader = contexto.ExecutaComandoComRetorno(strQuery);
                return TransformaReaderEmListaDeObjeto(retornoDataReader).FirstOrDefault();
            }
        }

        private List<Usuario> TransformaReaderEmListaDeObjeto(SqlDataReader reader)
        {
            var usuario = new List<Usuario>();
            while (reader.Read())
            {
                var temObjeto = new Usuario()
                {
                    Id = reader.ReadAsInt("Id"),
                    Nome = reader.ReadAsString("Nome"),
                    Nivel = reader.ReadAsString("Nivel")
                };
                usuario.Add(temObjeto);
            }

            reader.Close();
            return usuario;
        }
    }
}
