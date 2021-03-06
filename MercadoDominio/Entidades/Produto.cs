﻿using System.ComponentModel;
using System.ComponentModel.DataAnnotations;

namespace MercadoDominio.Entidades
{
    public class Produto
    {
        public int Id { get; set; }

        [Required(ErrorMessage = "Preencha o campo do nome do produto")]
        [DisplayName("Nome do produto: ")]
        [StringLength(50, ErrorMessage = "O produto deve ter no mínimo 2 letras e no máximo 50", MinimumLength = 2)]
        public string Nome { get; set; }

        public int IdFabricante { get; set; }
        public int IdDistribuidor { get; set; }

        [Required(ErrorMessage = "Preencha o valor")]
        [RegularExpression(@"^\d+.?\d{0,2}$", ErrorMessage = "Valor de preço inválido, lembre-se de preencher no máximo 2 casas decimais e apenas números.")]
        [Range(1, 9999, ErrorMessage = "Valor informado inválido")]
        [DisplayName("Valor: ")]
        public decimal Valor { get; set; }

        [DisplayName("Imagem desejada: ")]
        public string Imagem { get; set; }

        public Fabricante Fabricante { get; set; }
        public Distribuidor Distribuidor { get; set; }
    }
}
