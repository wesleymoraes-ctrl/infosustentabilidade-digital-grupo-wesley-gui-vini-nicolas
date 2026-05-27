### 📸 5. evidencias
Registro visual ou documental que comprova a existência e a situação do ponto de coleta.


| Campo | Tipo / Descrição |
| :--- | :--- |
| **id** | Identificador único da evidência |
| **id ponto** | Vínculo com a tabela pontos_coleta (Chave Estrangeira) |
| **tipo** | Categoria do arquivo (Ex: Foto, Vídeo, Relatório, Print) |
| **descrição** | Detalhes do que a evidência está provando |
| **arquivo/link** | URL da imagem armazenada (Storage do Supabase ou Drive) |
| **data_verificação**| Data em que a evidência foi coletada ou checada |
