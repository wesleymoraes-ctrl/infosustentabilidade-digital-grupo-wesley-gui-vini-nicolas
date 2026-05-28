# 📋 Orientação para Descarte de Resíduos

> [!NOTE]
> Manual prático sobre os procedimentos logísticos e operacionais para a entrega de lixo eletrônico nos municípios analisados pelo grupo (Atalanta, Vitor Meireles, Indaial e Brusque).

## 🛠️ Regras de Funcionamento Técnico (`procedimentos_descarte`)

> [!TIP]
> Esta tabela operacional define as condições que o cidadão precisa cumprir antes de se deslocar até um ponto de coleta.

| Campo | Tipo | Descrição |
| :--- | :--- | :--- |
| 🆔 `id` | INT / UUID | Identificador único do procedimento (**PK**) |
| 🔑 `id_ponto` | INT / UUID | Código de associação ao local de coleta (**FK**) |
| ⏰ `horário` | VARCHAR | Dias da semana e turnos de atendimento |
| 📅 `agendamento`| VARCHAR / BOOL | Define se exige marcação prévia de horário |
| 💰 `custo` | DECIMAL / TEXT| Taxa cobrada ou indicação de gratuidade |
| 🚗 `modalidade` | VARCHAR | Formato (Entrega direta, Coleta domiciliar, Drive-thru) |
| 📝 `descrição` | TEXT | Passo a passo detalhado do procedimento |

### 📌 Como isso funciona na prática (Nossa Pesquisa)
De acordo com os dados levantados pela equipe nas quatro cidades, o cenário atual de procedimentos é:
* **⏰ Horário:** Em todos os municípios analisados, as entregas ocorrem em **horário comercial**.
* **📅 Agendamento & Custo:** Atualmente, **nenhum** dos pontos mapeados exige agendamento prévio e **todos são 100% gratuitos** para a população.
* **🚗 Modalidade:** A maioria funciona no formato de **Entrega Direta** (o cidadão leva até o local, como na Prefeitura de Atalanta ou na UNIFEBE em Brusque). Em Vitor Meireles, há registro de viabilidade de *Coleta no local*.

---

## 💡 Instruções Gerais de Segurança para o Cidadão

> [!WARNING]
> Cuidado ao manusear certos tipos de componentes eletrônicos. O descarte inadequado ou a tentativa de desmontagem pode liberar metais pesados tóxicos (chumbo, mercúrio e cádmio).

* 📦 **Armazenamento Seguro:** Enquanto aguarda a data de uma campanha municipal, guarde os equipamentos estragados em local seco, ventilado e protegido da chuva.
* 🔋 **Baterias e Pilhas:** Nunca descarte se estiverem estufadas, aquecendo ou vazando sem proteção. Isole-as em potes plásticos selados ou sacos resistentes. Se houver risco iminente, busque pólos de coleta contínua de emergência.
* 🔒 **Apagamento de Dados:** Remova contas, formate cartões de memória e apague dados pessoais de celulares, tablets e computadores antes de entregá-los nos pontos de coleta.
* ⚠️ **Integridade Física:** Nunca tente abrir baterias e não quebre telas de monitores ou tubos de TV antigos para evitar contaminação por mercúrio ou chumbo.
* 🔥 **Risco de Fogo:** Jamais queime fios de cobre para retirar o plástico. A queima desses materiais libera gases altamente cancerígenos na atmosfera.
* 🗑️ **Lixo Comum:** Sob nenhuma hipótese descarte qualquer tipo de lixo eletrônico nas lixeiras de lixo comum (orgânico ou reciclável doméstico).


[⬅️ Voltar para o README principal](../README.md)
