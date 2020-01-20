# ProductListingChallenge
A Product List application using MVC + Coordinator

# How to Run
- Run ```swift
pod install```

- Install swiftLint: https://github.com/swiftlint/swiftlint


# Resultado(Portuguese)

O Projeto tinha como objetivo principal demostrar separação de responsabilidades de acordo com o SOLID, resolvi separar as responsabilidades utilizando childViewControllers para cada View e separação de targets com mentalidade de desenvolvimento orientada a framework, resultando assim num MVC sem uma massive View Controller e views reutilizaveis, Geralmente cada caso de uso(Lista de Produtos e Detalhes de Produto) tem um Container responsável por fazer um Request e popular as ChildViewControllers, em casos específicos como Avaliações tem um Container próprio já que essa tela é populada por um request separado. 
O maior desafio foi organizar o auto-layout do container de detalhes de produtos já que tem muitas telas e tornar a coleção de produto reutilizavel, isso ficou mais facil com uma collectionViewCOntroller separada, no fim o projeto foi proveitoso para treinar o MVC.

