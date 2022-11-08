import 'package:latutsapp/models/moeda.dart';
import 'package:flutter/material.dart';

class MoedaRepository{
  static List<Moeda> tabela = [
    Moeda(
      icone: 'images/bitcoin.png',
      nome: 'Bitcoin',
      sigla: 'BTC',
      preco: 107597.94,
    ),
    Moeda(
      icone: 'images/ethereum.png',
      nome: 'Ethereum',
      sigla: 'ETH',
      preco: 8279.82,
    ),
    Moeda(
      icone: 'images/xrp.png',
      nome: 'XRP',
      sigla: 'XRP',
      preco: 2.46,
    ),
    Moeda(
      icone: 'images/cardano.png',
      nome: 'Cardano',
      sigla: 'ADA',
      preco: 2.14,
    ),
    Moeda(
      icone: 'images/usdcoin.png',
      nome: 'USD Coin',
      sigla: 'USDC',
      preco: 4.36,
    ),
    Moeda(
      icone: 'images/litecoin.png',
      nome: 'LiteCoin',
      sigla: 'LTC',
      preco: 348.09,
    ),

  ];
}