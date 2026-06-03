-- =============================================================================
-- 1. LIMPAR O BANCO DE DADOS (Evita conflitos)
-- =============================================================================
DROP TABLE IF EXISTS analise_critica CASCADE;
DROP TABLE IF EXISTS evidencias CASCADE;
DROP TABLE IF EXISTS procedimentos_descarte CASCADE;
DROP TABLE IF EXISTS materiais_aceitos CASCADE;
DROP TABLE IF EXISTS pontos_coleta CASCADE;

-- =============================================================================
-- 2. CRIAR AS TABELAS
-- =============================================================================
CREATE TABLE pontos_coleta (
    id_ponto SERIAL PRIMARY KEY,
    nome_local VARCHAR(250) NOT NULL,
    endereco VARCHAR(250) NOT NULL,
    bairro VARCHAR(100),
    cidade VARCHAR(100) NOT NULL,
    contato VARCHAR(150),
    link_maps TEXT,
    observacao TEXT
);

CREATE TABLE materiais_aceitos (
    id_material SERIAL PRIMARY KEY,
    id_ponto INTEGER REFERENCES pontos_coleta(id_ponto) ON DELETE CASCADE,
    tipo_material VARCHAR(150) NOT NULL,
    aceita BOOLEAN DEFAULT TRUE,
    observacao TEXT
);

CREATE TABLE procedimentos_descarte (
    id_procedimento SERIAL PRIMARY KEY,
    id_ponto INTEGER REFERENCES pontos_coleta(id_ponto) ON DELETE CASCADE,
    horario_funcionamento VARCHAR(150),
    precisa_agendamento BOOLEAN DEFAULT FALSE,
    possui_custo BOOLEAN DEFAULT FALSE,
    modalidade VARCHAR(100),
    descricao_processo TEXT
);

CREATE TABLE evidencias (
    id_evidencia SERIAL PRIMARY KEY,
    id_ponto INTEGER REFERENCES pontos_coleta(id_ponto) ON DELETE CASCADE,
    tipo_evidencia VARCHAR(100),
    descricao TEXT,
    arquivo_ou_link TEXT,
    data_verificacao DATE DEFAULT CURRENT_DATE
);

CREATE TABLE analise_critica (
    id_analise SERIAL PRIMARY KEY,
    id_ponto INTEGER REFERENCES pontos_coleta(id_ponto) ON DELETE CASCADE,
    cidade VARCHAR(100) NOT NULL,
    facilidade TEXT,
    dificuldade TEXT,
    divulgacao TEXT,
    melhoria TEXT
);

-- =============================================================================
-- 3. INSERIR OS DADOS
-- =============================================================================
INSERT INTO pontos_coleta (id_ponto, nome_local, endereco, bairro, cidade, contato, link_maps) VALUES
(1, 'Campanha "Penso, Logo Destino!"', 'Prefeitura de Atalanta', 'Centro', 'Atalanta', '(47) 3535-0229.', 'google.com/maps?sca_esv=eaf5d82a5c8d6869&rlz=1CAXXPU_enBR1216&output=search&q=prefeitura+de+atalanta&source=lnms&fbs=ADc_l-acAb_3MMOAUx0zmbUpgBqRlhw7OXlLrtqB_9zD4FpX7o7eSzIUUHbPQDqjftNPzSQaei_ZWI-xk0JUIFOojjd66v-C6YS3PH_Bnana0Q4S4K0YE_F4542eJWGAR5YDhbgyzruIRN-aCBPmTjNdJc2DGB1KD6SmPo3l2Kv0KhQXI5pXL_rQAT0HLzE4Sh2k2gLsVQ6VVByJrNcAnNFGcbgM5Ci2JA&entry=mc&ved=1t:200715&ictx=111'),
(2, 'Secretaria de Agricultura, Silvicultura, Pecuária e Meio Ambiente – Prefeitura de Vitor Meireles', 'Rua Santa Catarina, 2617 – Centro, Vitor Meireles – SC, CEP 89.148-000', 'Centro', 'Vitor Meireles', '(47) 3258-0211', 'google.com/maps?sca_esv=eaf5d82a5c8d6869&rlz=1CAXXPU_enBR1216&output=search&q=prefeitura+vitor+meireles&source=lnms&fbs=ADc_l-acAb_3MMOAUx0zmbUpgBqRlhw7OXlLrtqB_9zD4FpX7o7eSzIUUHbPQDqjftNPzSTkGhe-yqJa75_wzuvH1LBZ8acEZwi8_1abKNysuc50bZLZejVTdbddP14VKVzdBcWajEVHFRnXNUw_ZMg2uqM_tEainR94yKO7LX0ayEyBegpkR0omrI59w_LyqQcQgUUF751uKZbBsr_ORB6EScaOVC19dg&entry=mc&ved=1t:200715&ictx=111'),
(3, 'LOCAIS DE DESCARTE DE LIXO ELETRÔNICO EM INDAIAL', 'Avenida Getúlio Vargas, Centro, Indaial – SC', 'Centro', 'Indaial', '(47)3317-8800', 'https://www.google.com/maps/place/Centro,+Indaial+-+SC,+89130-000/@-26.8953651,-49.243514,15z/data=!3m1!4b1!4m6!3m5!1s0x94df0293860f77f5:0xeefd9509bb2bb4f0!8m2!3d-26.8956747!4d-49.2343055!16s%2Fg%2F1ymtqsb9s?entry=ttu&g_ep=EgoyMDI2MDUyMC4wIKXMDSoASAFQAw%3D%3D\n'),
(4, 'Centro Universitario da fundação educacional de bursque', 'R. Vendelino Maffezzolli, 333', 'Santa Terezinha', 'Brusque', '(47) 3211-7000', 'https://www.google.com/maps/place/Centro+Universit%C3%A1rio+da+Funda%C3%A7%C3%A3o+Educacional+de+Brusque+-+UNIFEBE/data=!4m2!3m1!1s0x0:0x163534803cbb8e20?sa=X&ved=1t:2428&ictx=111');

INSERT INTO materiais_aceitos (id_material, id_ponto, tipo_material, aceita, observacao) VALUES
(1, 1, 'Aluminio', TRUE, 'Geladeiras'),
(2, 1, 'Litio', TRUE, 'pilhas modelo AA, AAA, bateria'),
(3, 1, 'Plastico', TRUE, 'monitores,ventilador, secador de cabelo'),
(4, 1, 'Vidro', TRUE, 'tablets, notebooks, celulares'),
(5, 1, 'Cobre', TRUE, 'Fios e carregadores'),
(6, 2, 'plástico', TRUE, 'tablets, notebooks, celulares'),
(7, 2, 'aluminio', TRUE, 'Geladeiras'),
(8, 2, 'litio', TRUE, 'pilhas modelo AA, AAA,'),
(9, 2, 'cobre', TRUE, 'Carregadores'),
(10, 3, 'Solda de estanho', TRUE, 'celulares'),
(11, 3, 'Litio', TRUE, 'Baterias'),
(12, 3, 'Aço', TRUE, 'Computador'),
(13, 3, 'Cobre', TRUE, 'Carregadores'),
(14, 3, 'Plastico', TRUE, 'Cabos'),
(15, 4, 'litio', TRUE, 'pilhas, baterias'),
(16, 4, 'cobre', TRUE, 'fios, carregadores'),
(17, 4, 'aluminio', TRUE, 'celulares, televisores,geladeiras,teclados'),
(18, 4, 'borracha', TRUE, 'geladeira'),
(19, 4, 'plastico', TRUE, 'mouse, teclado, monitores'),
(20, 4, 'vidro', TRUE, 'televisores, microondas, liquidificador');

INSERT INTO procedimentos_descarte (id_procedimento, id_ponto, horario_funcionamento, precisa_agendamento, possui_custo, modalidade) VALUES
(1, 1, 'Horario comercial', FALSE, FALSE, 'Entrega'),
(2, 2, 'Horario comercial', FALSE, FALSE, 'coleta no local'),
(3, 3, 'Horario comercial', FALSE, FALSE, 'Entrega'),
(4, 4, 'Horario comercial', FALSE, FALSE, 'Entrega');

INSERT INTO evidencias (id_evidencia, id_ponto, tipo_evidencia, descricao, arquivo_ou_link, data_verificacao) VALUES
(1, 1, 'post instagram', 'Campanha penso logo destino', 'https://www.instagram.com/p/DRCm8CfjvOl/', '2025-11-14'),
(2, 2, 'Site prefeitura', 'Divulgação pelo site', 'https://vitormeireles.sc.gov.br/', '2026-05-26'),
(3, 3, 'Site prefeitura', 'Lixo inteligente, descarte Conciete', 'https://www.indaial.sc.gov.br.', '2026-05-22'),
(4, 4, 'foto', 'foto do recipiente usado pela UNIFEBE', 'https://www.unifebe.edu.br/site/noticia/unifebe-e-ponto-de-coleta-de-lixo-eletronico/', '2020-01-28');

INSERT INTO analise_critica (id_analise, id_ponto, cidade, facilidade, dificuldade, divulgacao, melhoria) VALUES
(1, 1, 'Atalanta', 'fácil acesso para grande parte dos moradores, além também desse descarte abranger uma enorme variedade de itens.', 'ausência de um ponto físico permanente na cidade.', 'divulgação é realizada por meio das redes sociais da Prefeitura (Facebook) e de materiais visuais, como o panfleto da campanha ''Penso, Logo Destino!''', 'implementação de pelo menos um ponto de recebimento contínuo e permanente ou entao campanhas mensais'),
(2, 2, 'Vitor Meireles', 'Para a população de Vitor Meireles, o descarte correto de lixo eletrônico apresenta dificuldades consideráveis. Embora exista um ponto de coleta na própria sede da Prefeitura, sua divulgação é extremamente limitada:', 'falta de divulgação – nenhuma campanha visível orientando a população sobre o descarte de eletrônicos foi identificada nas comunicações oficiais da prefeitura; (2) ausência de ponto de coleta específico e sinalizado para eletrônicos no município, com estrutura adequada e horários amplos; (3)', 'A divulgação sobre descarte de eletrônicos em Vitor Meireles é praticamente inexistente', 'Criação de um Ponto de Entrega Voluntária (PEV) sinalizado e específico para eletrônicos, instalado em local de fácil acesso como o centro comunitário, a praça central ou o próprio pátio da Prefeitura, com horários definidos e comunicados amplamente à população;'),
(3, 3, 'Indaial', 'Indaial oferece pontos de descarte de lixo eletrônico por meio da prefeitura e de campanhas do SAMAE. Mesmo assim, os locais de coleta ainda são limitados e pouco acessíveis para moradores de bairros mais distantes.', 'Uma das principais dificuldades encontradas é a pouca divulgação dos pontos de coleta existentes no município.', 'Uma das principais dificuldades encontradas é a pouca divulgação dos pontos de coleta existentes no município. Muitas pessoas ainda não sabem onde descartar equipamentos eletrônicos ou não possuem conhecimento sobre os riscos ambientais causados pelo descarte incorreto. Outro problema é a baixa frequência das campanhas ambientais, o que reduz as oportunidades de descarte para a população.', 'Para melhorar o descarte de lixo eletrônico em Indaial, seria importante criar mais pontos fixos de coleta em diferentes bairros da cidade. Além disso, campanhas educativas em escolas, empresas e redes sociais poderiam aumentar a conscientização da população sobre os impactos ambientais causados pelo descarte incorreto. Outra proposta seria realizar parcerias com lojas de eletrônicos para incentivar a coleta de aparelhos antigos e facilitar o descarte correto.'),
(4, 4, 'Brusque', 'Em Brusque, o descarte de resíduos eletrônicos ocorre por meio de campanhas promovidas pela Prefeitura. Durante esses períodos, a população conta com um ponto de coleta localizado na região central do município, ao lado da Prefeitura, o que facilita o acesso para a maioria dos moradores. Além disso, as campanhas costumam aceitar uma ampla variedade de equipamentos e componentes eletrônicos.', 'A principal limitação observada é a inexistência de um local permanente para recebimento desses materiais. Dessa forma, quando algum aparelho apresenta defeito ou uma bateria sofre danos fora do período das campanhas, os moradores não dispõem de um ponto de descarte imediato. Como consequência, precisam armazenar em casa resíduos que podem representar riscos à saúde e ao meio ambiente até que uma nova coleta seja realizada.', 'A divulgação das campanhas é realizada principalmente por meio das redes sociais da Prefeitura, especialmente no Instagram, além da distribuição de materiais informativos. Essas ações são eficazes para informar a população, pois apresentam de forma clara o local de entrega, os tipos de materiais aceitos e o período de arrecadação. Também é provável que as informações sejam reforçadas por veículos de comunicação locais, como rádios e emissoras de televisão da região.', 'Uma proposta de melhoria para a coleta de lixo eletrônico em Brusque seria a criação de um programa municipal de coleta domiciliar. Nesse sistema, os moradores poderiam solicitar, por meio de um aplicativo, site ou telefone, o recolhimento de equipamentos eletrônicos inutilizados diretamente em suas residências. Essa iniciativa facilitaria o descarte correto de aparelhos como computadores, celulares, televisores e eletrodomésticos, reduzindo o descarte inadequado no meio ambiente. Além disso, a coleta domiciliar aumentaria a participação da população nas ações de reciclagem, contribuindo para a preservação ambiental e para o reaproveitamento de materiais que podem retornar à cadeia produtiva.');

-- =============================================================================
-- 4. ATUALIZAR CONTADORES (SEQUENCES)
-- =============================================================================
SELECT setval(pg_get_serial_sequence('pontos_coleta', 'id_ponto'), (SELECT MAX(id_ponto) FROM pontos_coleta));
SELECT setval(pg_get_serial_sequence('materiais_aceitos', 'id_material'), (SELECT MAX(id_material) FROM materiais_aceitos));
SELECT setval(pg_get_serial_sequence('procedimentos_descarte', 'id_procedimento'), (SELECT MAX(id_procedimento) FROM procedimentos_descarte));
SELECT setval(pg_get_serial_sequence('evidencias', 'id_evidencia'), (SELECT MAX(id_evidencia) FROM evidencias));
SELECT setval(pg_get_serial_sequence('analise_critica', 'id_analise'), (SELECT MAX(id_analise) FROM analise_critica));
