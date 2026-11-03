
# AF Sacolas — Schema 1: Dados Públicos

## Engenharia de Dados

Este repositório reúne os materiais desenvolvidos na etapa de Engenharia de Dados do projeto **AF Sacolas**, com foco na organização e análise de dados públicos relacionados ao comércio eletrônico brasileiro.

### Objetivo

Utilizar dados públicos para identificar indicadores do comércio eletrônico e contextualizar o mercado no qual o sistema AF Sacolas está inserido, contribuindo para sua justificativa de mercado.

### Fonte de dados

Foi utilizado o conjunto de dados **Brazilian E-Commerce Public Dataset by Olist**, disponibilizado no Kaggle.

A base contém informações históricas sobre pedidos, produtos, pagamentos e clientes de uma plataforma de comércio eletrônico brasileira, abrangendo o período de setembro de 2016 a outubro de 2018.

**Fonte:** [Olist Brazilian E-Commerce Dataset — Kaggle](https://www.kaggle.com/datasets/olistbr/brazilian-ecommerce)

### Tecnologias utilizadas

- MySQL — criação e gerenciamento do banco de dados;
- SQL — consultas e análises dos dados;
- CSV — formato dos arquivos de origem.

### Estrutura do banco de dados

Foi criado o banco de dados `schema1_dados_publicos`, composto por quatro tabelas:

| Tabela | Descrição |
|---|---|
| `orders` | Informações dos pedidos |
| `order_items` | Itens, preços e fretes |
| `order_payments` | Formas e valores de pagamento |
| `customers` | Dados e localização dos clientes |

### Dados importados

| Tabela | Registros |
|---|---:|
| orders | 99.441 |
| order_items | 112.650 |
| order_payments | 103.886 |
| customers | 99.441 |
| **Total** | **415.418** |

### Análises realizadas

Foram desenvolvidas consultas SQL utilizando:

- `SUM()` — soma de valores;
- `AVG()` — cálculo de médias;
- `MAX()` — identificação de valores máximos;
- `MIN()` — identificação de valores mínimos;
- `COUNT()` — contagem de registros;
- `GROUP BY` — agrupamento dos dados;
- `ORDER BY` — ordenação dos resultados;
- `INNER JOIN` — relacionamento entre tabelas.

As análises contemplaram:
- Valores totais e médios dos produtos;
- Distribuição das formas de pagamento;
- Evolução mensal das vendas;
- Situação dos pedidos;
- Distribuição geográfica dos clientes;
- Valor médio dos pedidos por estado.

### Relação com o AF Sacolas

Os indicadores obtidos permitem contextualizar a movimentação do comércio eletrônico brasileiro e discutir oportunidades relacionadas ao fornecimento de sacolas, embalagens e materiais promocionais.

**Observação:** a base utilizada não contém dados específicos sobre a comercialização de sacolas. Portanto, seus resultados são utilizados como indicadores indiretos do cenário comercial.

### Responsável

Letícia Rayane Pereira da Silva

**Projeto:** AF Sacolas  
**Área:** Engenharia de Dados — Schema 1 (Dados Públicos)
