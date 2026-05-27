### 📋 2. procedimentos_descarte
Define as regras, horários e condições para realizar o descarte em cada ponto.


| Campo | Tipo / Descrição |
| :--- | :--- |
| **id** | Identificador único do procedimento |
| **id ponto** | Vínculo com a tabela pontos_coleta (Chave Estrangeira) |
| **horário** | Dias e horas de atendimento |
| **agendamento** | Indica se precisa agendar antes (Sim/Não) |
| **custo** | Se o descarte é gratuito ou possui taxa |
| **modalidade** | Entrega direta, drive-thru, coleta domiciliar, etc. |
| **descrição** | Instruções passo a passo para o usuário |
