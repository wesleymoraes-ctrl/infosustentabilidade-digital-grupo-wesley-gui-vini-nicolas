

## 👥 1.0 Evidências do GitHub (Participação e Divisão)

Para garantir que todos os integrantes apareçam no histórico do repositório, as tarefas e edições de arquivos foram divididas da seguinte forma:

* **🧑‍💻 Wesley (Aluno 1):** Responsável por criar e editar o arquivo principal `README.md` (visão geral, problema, propostas e análise crítica).
* **🧑‍💻 Guilherme (Aluno 2):** Responsável por criar e editar o dicionário de dados no arquivo `docs/modelo-dados.md` (estruturação das tabelas).
* **🧑‍💻 Vinícius (Aluno 3):** Responsável por criar e editar a base de dados JSON em `data/pontos-coleta.json` e a construção da query de tabelas em `sql/script.sql`.
* **🧑‍💻 Nicolas (Aluno 4):** Responsável por estruturar as evidências, criar este arquivo `evidencias/evidencias.md` e auxiliar na importação dos dados no Supabase.

---

## 📍 2. Evidências da Pesquisa Anterior (Pontos de Coleta)

Abaixo estão os dados reais encontrados durante a pesquisa de campo e mapeamento da nossa região, contendo o nome, endereço, tipo de evidência e o arquivo/link comprobatório:

| ID | Nome do Ponto de Coleta | Endereço | Tipo de Evidência | Arquivo / Link |
| :---: | :--- | :--- | :--- | :--- |
| **1** | Campanha "Penso, Logo Destino!" | Prefeitura de Atalanta | Post Instagram / Imagem | [Link](https://www.instagram.com/p/DRCm8CfjvOl/) / ![Foto](../image_1eeee4.png) |
| **2** | Sec. Agricultura e Meio Ambiente | Rua Santa Catarina, 2617, Vitor Meireles | Site Prefeitura | [Acessar Site](https://vitormeireles.sc.gov.br/) |
| **3** | Locais de Descarte de Lixo Eletrônico | Av. Getúlio Vargas, Centro, Indaial | Site Prefeitura | [Acessar Site](https://www.indaial.sc.gov.br) |
| **4** | Recipiente de Coleta UNIFEBE | R. Vendelino Maffezzolli, 333, Brusque | Foto / Notícia | [Acessar Notícia](https://www.unifebe.edu.br/site/noticia/unifebe-e-ponto-de-coleta-de-lixo-eletronico/) |

---

## 📊 3. Evidências da Planilha

Os dados brutos que alimentaram este projeto foram inicialmente catalogados e higienizados através do Google Sheets.

* **🔗 Link do Google Sheets:** [Acessar Planilha de Dados Brutos](https://docs.google.com/spreadsheets/d/1xcxSNNiipvU9QezDOclQ_O7zG0jjs_6CYyKTSK3xKKk/edit?usp=sharing)
* **📑 Lista das Abas Criadas:**
  1. `Pontos_coletas` (Tabela principal)
  2. `Materiais_aceitos`
  3. `Procedimentos_descartes`
  4. `Evidencias`
  5. `Analise_Critica`

---

## 🗄️ 4. Evidências do Supabase

O nosso banco de dados relacional (PostgreSQL) foi hospedado e gerido utilizando a plataforma Supabase.

* **Nome do Projeto no Supabase:** InfoSustentabilidade
* **Tabelas Criadas:**
  1. `pontos_coleta` (Chave Primária)
  2. `materiais_aceitos` (Chave Estrangeira ligada ao ponto)
  3. `procedimentos_descarte` (Chave Estrangeira ligada ao ponto)
  4. `evidencias` (Chave Estrangeira ligada ao ponto)
  5. `analise_critica` (Chave Estrangeira ligada ao ponto)

---

## 💻 5. Consulta SQL Executada e Aprendizados

* **Consulta SQL executada no Supabase?** Sim. Executamos o arquivo `sql/script.sql` contendo os comandos `CREATE TABLE` e posteriormente os comandos `INSERT INTO` para alimentar o banco.

### ⚠️ Dificuldades Encontradas:
Durante a execução dos scripts e a importação dos dados (CSVs), enfrentamos dificuldades técnicas com as Chaves Estrangeiras (IDs não correspondentes entre as tabelas) e formatos de dados inválidos (como datas escritas por extenso e campos nulos). Além disso, a sincronização dos contadores de ID automático do Supabase (`sequences`) gerou erros de conflito de chave primária nas primeiras tentativas de inserção.

### 💡 Aprendizados do Grupo:
Com a resolução desses problemas, aprendemos a importância vital da higienização prévia dos dados antes de submetê-los a um banco relacional. Aprendemos a utilizar a restrição `ON DELETE CASCADE` para manter a integridade do banco e descobrimos a importância de utilizar a função `setval` no PostgreSQL para atualizar corretamente o contador de IDs após a inserção em massa de dados, garantindo a estabilidade futura do sistema.
