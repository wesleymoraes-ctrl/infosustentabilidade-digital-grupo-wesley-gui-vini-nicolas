# 📋 Orientação para Descarte de Resíduos

> [!NOTE]
> Manual prático sobre os procedimentos logísticos e operacionais para a entrega de lixo eletrônico nos municípios do Alto Vale.

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

## 💡 Instruções Gerais de Segurança para o Cidadão

> [!WARNING]
> Cuidado ao manusear certos tipos de componentes eletrônicos.

* 🔋 **Baterias e Pilhas:** Nunca descarte se estiverem estufadas ou vazando sem proteção plástica isolante.
* 🔒 **Apagamento de Dados:** Remova contas, fotos e dados pessoais de celulares e computadores antes de descartar.
* ⚠️ **Integridade Física:** Não quebre telas de monitores ou tubos de TV para evitar contaminação por mercúrio ou chumbo.
