# 🗂️ Modelo de Dados - Lixo Eletrônico Alto Vale

> [!NOTE]
> Este documento detalha a arquitetura do banco de dados relacional hospedado no **Supabase**, utilizado para mapear, gerenciar e integrar o descarte de resíduos tecnológicos na região do Alto Vale.

## 🗺️ Diagrama de Relações (Conceitual)

* 📍 `pontos_coletas` (1) ───► (N) 📋 `procedimentos_descartes`
* 📍 `pontos_coletas` (1) ───► (N) 🔌 `materiais_aceitos`
* 📍 `pontos_coletas` (1) ───► (N) 📸 `evidecias`
* 📊 `analise_critica` (1) ───► (1) 📍 `pontos_coletas` *(Mapeado via ID da cidade/ponto)*

---

## 📊 Dicionário de Dados

### 📍 Tabela: `pontos_coletas`

> [!TIP]
> Armazena a localização exata, endereço, bairro e as formas de contato dos pontos físicos de coleta ou campanhas cadastrados.

| Campo | Tipo | Descrição | Chave |
| :--- | :--- | :--- | :--- |
| 🆔 `id` | INT / SERIAL | Identificador único da cidade/ponto do grupo | **PK** |
| 🏢 `nome` | VARCHAR | Nome do local ou instituição (Ex: Unifebe, Prefeitura) | |
| 🏠 `endereço` | VARCHAR | Rua, número e detalhes da localização | |
| 🏘️ `bairro` | VARCHAR | Bairro onde o ponto está localizado | |
| 🏙️ `cidade` | VARCHAR | Nome do município catarinense mapeado | |
| 📞 `contato` | VARCHAR | Telefone ou meio de comunicação com o local | |
| 🌐 `link_maps` | TEXT | URL de geolocalização do Google Maps | |

### 🔌 Tabela: `materiais_aceitos`

> [!IMPORTANT]
> Relação das categorias de matérias-primas e resíduos químicos que cada estabelecimento ou campanha está autorizado a coletar.

| Campo | Tipo | Descrição | Chave |
| :--- | :--- | :--- | :--- |
| 🆔 `id_material` | INT / SERIAL | Identificador único do material cadastrado | **PK** |
| 🔑 `id_ponto` | INT | Vínculo com o identificador da tabela `pontos_coletas` | **FK** |
| 🔋 `tipo_material` | VARCHAR | Componente químico base (Ex: Litio, Cobre, Aluminio) | |
| ✅ `aceita` | VARCHAR(1) | Flag indicando se aceita (`S` para Sim / `N` para Não) | |
| 📝 `observação` | TEXT | Detalhamento dos aparelhos equivalentes (Ex: pilhas, TVs) | |

### 📋 Tabela: `procedimentos_descartes`

> [!NOTE]
> Define a logística operacional, regras de atendimento, custos e modalidade de recepção do lixo eletrônico.

| Campo | Tipo | Descrição | Chave |
| :--- | :--- | :--- | :--- |
| 🆔 `id` | INT / SERIAL | Identificador do procedimento logístico | **PK** |
| 🔑 `id_ponto` | INT | Vínculo com o identificador da tabela `pontos_coletas` | **FK** |
| ⏰ `horarios` | VARCHAR | Período de funcionamento ou tipo de horário de recebimento | |
| 📅 `agendamentos` | VARCHAR(1) | Necessita de agendamento prévio? (`S` ou `N`) | |
| 💰 `custo` | VARCHAR(1) | Possui cobrança de taxas associadas? (`S` ou `N`) | |
| 🚚 `modalidade` | VARCHAR | Tipo de recolha (Ex: Entrega, Coleta no local) | |

### 📸 Tabela: `evidecias`

> [!WARNING]
> Registro oficial de links e mídias que comprovam visualmente e dão veracidade à existência real dos ecossistemas de coleta.

| Campo | Tipo | Descrição | Chave |
| :--- | :--- | :--- | :--- |
| 🆔 `Id` | INT / SERIAL | Identificador único do registro da evidência | **PK** |
| 🔑 `Id_pontos` | INT | Vínculo com o identificador da tabela `pontos_coletas` | **FK** |
| 📂 `Tipos` | VARCHAR | Meio de comprovação (Ex: post instagram, Site prefeitura, foto) | |
| 📄 `Descrição` | TEXT | Texto explicando o teor do arquivo ou material provado | |
| 🔗 `Arquivoslinks` | TEXT | URL direta para visualização da mídia ou do portal público | |
| 📅 `Data` | VARCHAR / DATE | Data de publicação ou da verificação realizada pelo grupo | |

### 📊 Tabela: `analise_critica`

> [!TIP]
> Concentra as análises qualitativas desenvolvidas pela equipe de pesquisa, estruturadas sob os códigos identificadores de cada localidade.

| Campo | Tipo | Descrição | Chave |
| :--- | :--- | :--- | :--- |
| 🆔 `id` | INT | Identificador correspondente ao município/ponto avaliado | **PK** / **FK** |
| 🏙️ `cidade` | VARCHAR | Nome do município que passou pelo diagnóstico | |
| 🟢 `facilidade` | TEXT | Pontos positivos identificados no sistema de descarte | |
| 🔴 `dificuldade` | TEXT | Gargalos e carências operacionais sofridos pela população | |
| 📣 `divulgação` | TEXT | Nível e eficácia dos canais de comunicação locais | |
| 🚀 `melhoria` | TEXT | Soluções propostas pelo grupo para otimizar o ecossistema | |

---
[⬅️ Voltar para o README principal](../README.md)
