-- phpMyAdmin SQL Dump
-- version 5.1.1deb5ubuntu1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Tempo de geração: 29-Jan-2025 às 16:20
-- Versão do servidor: 10.6.18-MariaDB-0ubuntu0.22.04.1
-- versão do PHP: 8.1.2-1ubuntu2.20

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `i233341_PAP`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `Clientes`
--

CREATE TABLE `Clientes` (
  `id_cliente` int(11) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `telefone` varchar(15) NOT NULL,
  `morada` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Extraindo dados da tabela `Clientes`
--

INSERT INTO `Clientes` (`id_cliente`, `nome`, `email`, `telefone`, `morada`) VALUES
(1, 'João Silva', 'joao.silva@example.com', '912345678', 'Rua Principal, 123'),
(2, 'Maria Costa', 'maria.costa@example.com', '913456789', 'Avenida Central, 45');

-- --------------------------------------------------------

--
-- Estrutura da tabela `Funcionarios`
--

CREATE TABLE `Funcionarios` (
  `id_funcionario` int(11) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `especialidade` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `telefone` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Extraindo dados da tabela `Funcionarios`
--

INSERT INTO `Funcionarios` (`id_funcionario`, `nome`, `especialidade`, `email`, `telefone`) VALUES
(1, 'Carlos Ribeiro', 'Mecânica Geral', 'carlos.ribeiro@example.com', '914567890'),
(2, 'Ana Santos', 'Eletrónica', 'ana.santos@example.com', '915678901');

-- --------------------------------------------------------

--
-- Estrutura da tabela `Notificacoes`
--

CREATE TABLE `Notificacoes` (
  `id_notificacao` int(11) NOT NULL,
  `id_reserva` int(11) NOT NULL,
  `mensagem` text NOT NULL,
  `data_envio` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Extraindo dados da tabela `Notificacoes`
--

INSERT INTO `Notificacoes` (`id_notificacao`, `id_reserva`, `mensagem`, `data_envio`) VALUES
(1, 1, 'Sua reserva para Troca de Óleo está pendente.', '2025-03-09 09:00:00'),
(2, 2, 'Reserva confirmada para Revisão Completa no dia 12/03.', '2025-03-11 10:00:00');

-- --------------------------------------------------------

--
-- Estrutura da tabela `Reservas`
--

CREATE TABLE `Reservas` (
  `id_reserva` int(11) NOT NULL,
  `id_cliente` int(11) NOT NULL,
  `id_servico` int(11) NOT NULL,
  `id_funcionario` int(11) NOT NULL,
  `data_reserva` date NOT NULL,
  `hora_reserva` time NOT NULL,
  `estado` enum('Pendente','Confirmada','Cancelada','Concluída') NOT NULL DEFAULT 'Pendente'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Extraindo dados da tabela `Reservas`
--

INSERT INTO `Reservas` (`id_reserva`, `id_cliente`, `id_servico`, `id_funcionario`, `data_reserva`, `hora_reserva`, `estado`) VALUES
(1, 1, 1, 1, '2025-03-10', '10:00:00', 'Pendente'),
(2, 2, 2, 2, '2025-03-12', '14:00:00', 'Confirmada');

-- --------------------------------------------------------

--
-- Estrutura da tabela `Servicos`
--

CREATE TABLE `Servicos` (
  `id_servico` int(11) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `descricao` text NOT NULL,
  `duracao` int(11) NOT NULL,
  `preco` decimal(8,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Extraindo dados da tabela `Servicos`
--

INSERT INTO `Servicos` (`id_servico`, `nome`, `descricao`, `duracao`, `preco`) VALUES
(1, 'Troca de Óleo', 'Substituição do óleo e filtro do motor.', 45, '50.00'),
(2, 'Revisão Completa', 'Verificação completa de fluídos, travões e motor.', 90, '150.00'),
(3, 'Alinhamento de Direção', 'Correção do alinhamento do veículo.', 60, '75.00');

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `Clientes`
--
ALTER TABLE `Clientes`
  ADD PRIMARY KEY (`id_cliente`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Índices para tabela `Funcionarios`
--
ALTER TABLE `Funcionarios`
  ADD PRIMARY KEY (`id_funcionario`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Índices para tabela `Notificacoes`
--
ALTER TABLE `Notificacoes`
  ADD PRIMARY KEY (`id_notificacao`),
  ADD KEY `id_reserva` (`id_reserva`);

--
-- Índices para tabela `Reservas`
--
ALTER TABLE `Reservas`
  ADD PRIMARY KEY (`id_reserva`),
  ADD KEY `id_cliente` (`id_cliente`),
  ADD KEY `id_servico` (`id_servico`),
  ADD KEY `id_funcionario` (`id_funcionario`);

--
-- Índices para tabela `Servicos`
--
ALTER TABLE `Servicos`
  ADD PRIMARY KEY (`id_servico`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `Clientes`
--
ALTER TABLE `Clientes`
  MODIFY `id_cliente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `Funcionarios`
--
ALTER TABLE `Funcionarios`
  MODIFY `id_funcionario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `Notificacoes`
--
ALTER TABLE `Notificacoes`
  MODIFY `id_notificacao` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `Reservas`
--
ALTER TABLE `Reservas`
  MODIFY `id_reserva` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `Servicos`
--
ALTER TABLE `Servicos`
  MODIFY `id_servico` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `Notificacoes`
--
ALTER TABLE `Notificacoes`
  ADD CONSTRAINT `Notificacoes_ibfk_1` FOREIGN KEY (`id_reserva`) REFERENCES `Reservas` (`id_reserva`);

--
-- Limitadores para a tabela `Reservas`
--
ALTER TABLE `Reservas`
  ADD CONSTRAINT `Reservas_ibfk_1` FOREIGN KEY (`id_cliente`) REFERENCES `Clientes` (`id_cliente`),
  ADD CONSTRAINT `Reservas_ibfk_2` FOREIGN KEY (`id_servico`) REFERENCES `Servicos` (`id_servico`),
  ADD CONSTRAINT `Reservas_ibfk_3` FOREIGN KEY (`id_funcionario`) REFERENCES `Funcionarios` (`id_funcionario`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
