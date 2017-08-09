﻿using System.ComponentModel;
using System.ComponentModel.DataAnnotations;

namespace Mercado.Dominio
{
    public class Produto
    {
        public int Id { get; set; }

        [Required(ErrorMessage = "Preencha o campo do nome do produto")]
        [DisplayName("Nome do produto: ")]
        public string Nome { get; set; }

        public int IdFabricante { get; set; }
        public int IdDistribuidor { get; set; }

        [Required(ErrorMessage = "Preencha o valor")]
        [DisplayName("Valor: ")]
        public decimal Valor { get; set; }

        public Fabricante Fabricante { get; set; }
        public Distribuidor Distribuidor { get; set; }
    }
}
