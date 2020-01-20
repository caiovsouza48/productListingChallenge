//
//  Seeds.swift
//  ProductListMVCTests
//
//  Created by Caio de Souza on 19/01/20.
//  Copyright © 2020 Caio de Souza. All rights reserved.
//

import Foundation

/// Generated Data for Unit Testing
struct Seeds {
    struct ProductApiRespone {
        static let responseData = """
        {
            "produtos": [
            {
                "id": 2042243,
                "sku": 4793652,
                "nome": "Smart TV LED 32 HD Samsung 32J4300 com Connect Share Movie, Screen Mirroring, Wi-Fi, Entradas HDMI e Entrada USB",
                "disponivel": true,
                "descricao": "Smart TV LED 32 HD Samsung 32J4300 com Connect Share Movie, Screen Mirroring, Wi-Fi, Entradas HDMI e Entrada USB",
                "imagemUrl": "http://www.casasbahia-imagens.com.br/Control/ArquivoExibir.aspx?IdArquivo=114318676",
                "classificacao": 4,
                "preco": {
                    "planoPagamento": "9x de R$99,89",
                    "valorParcela": 99.89,
                    "quantidadeMaximaParcelas": 9,
                    "precoAtual": 899.0,
                    "precoAnterior": 1603.5,
                    "porcentagemDesconto": 44,
                 }
            }
            ],
        "quantidade": 476
        }
        """.data(using: .utf8)!
    }
    
}
