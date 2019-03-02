-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: 26-Fev-2019 às 22:10
-- Versão do servidor: 10.1.35-MariaDB
-- versão do PHP: 7.2.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `tschoolbd`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `ts_aluno`
--

CREATE TABLE `ts_aluno` (
  `codigo` int(11) NOT NULL,
  `cod_curso` int(11) NOT NULL,
  `cidade` varchar(50) NOT NULL,
  `cpf` varchar(11) NOT NULL,
  `endereco` varchar(200) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `rg` varchar(9) NOT NULL,
  `sexo` varchar(9) NOT NULL,
  `uf` varchar(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `ts_curso`
--

CREATE TABLE `ts_curso` (
  `codigo` int(11) NOT NULL,
  `periodo` varchar(10) NOT NULL,
  `qtd_aluno_s` int(11) NOT NULL,
  `titulo` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `ts_materia`
--

CREATE TABLE `ts_materia` (
  `codigo` int(11) NOT NULL,
  `codigo_curso` int(11) NOT NULL,
  `carga_horaria` int(11) NOT NULL,
  `titulo` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `ts_matricula`
--

CREATE TABLE `ts_matricula` (
  `codigo` int(11) NOT NULL,
  `cod_aluno` int(11) NOT NULL,
  `codigo_prof_mate` int(11) NOT NULL,
  `codigo_materia` int(11) NOT NULL,
  `data_matricula` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `media` varchar(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `ts_professor`
--

CREATE TABLE `ts_professor` (
  `codigo` int(11) NOT NULL,
  `N_registro` varchar(20) NOT NULL,
  `cidade` varchar(50) NOT NULL,
  `cpf` varchar(11) NOT NULL,
  `endereco` varchar(200) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `rg` varchar(9) NOT NULL,
  `sexo` varchar(9) NOT NULL,
  `uf` varchar(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `ts_prof_mate`
--

CREATE TABLE `ts_prof_mate` (
  `codigo` int(11) NOT NULL,
  `cod_materia` int(11) NOT NULL,
  `cod_prof` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `ts_prova`
--

CREATE TABLE `ts_prova` (
  `codigo` int(11) NOT NULL,
  `codigo_prof` int(11) NOT NULL,
  `titulo` varchar(255) NOT NULL,
  `texto` text NOT NULL,
  `tempo` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `ts_provasavaliadas`
--

CREATE TABLE `ts_provasavaliadas` (
  `codigo` int(11) NOT NULL,
  `cod_provafinalizada` int(11) NOT NULL,
  `nota` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `ts_provasfinalizadas`
--

CREATE TABLE `ts_provasfinalizadas` (
  `codigo` int(11) NOT NULL,
  `codigo_aluno` int(11) NOT NULL,
  `codigo_prova` int(11) NOT NULL,
  `texto` text NOT NULL,
  `corrigida` tinyint(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `ts_secretario`
--

CREATE TABLE `ts_secretario` (
  `codigo` int(11) NOT NULL,
  `cidade` varchar(50) NOT NULL,
  `cpf` varchar(11) NOT NULL,
  `endereco` varchar(200) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `rg` varchar(9) NOT NULL,
  `sexo` varchar(9) NOT NULL,
  `uf` varchar(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `ts_usuarios`
--

CREATE TABLE `ts_usuarios` (
  `codigo` int(11) NOT NULL,
  `usuario` varchar(30) NOT NULL,
  `senha` varchar(100) NOT NULL,
  `tipo` char(1) NOT NULL,
  `cod_tipo` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `ts_usuarios`
--

INSERT INTO `ts_usuarios` (`codigo`, `usuario`, `senha`, `tipo`, `cod_tipo`) VALUES
(1, 'aluno1', '123456', '1', 0),
(2, 'prof1', '1234', '2', 0),
(3, 'secretario1', '123', '3', 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `ts_aluno`
--
ALTER TABLE `ts_aluno`
  ADD PRIMARY KEY (`codigo`);

--
-- Indexes for table `ts_curso`
--
ALTER TABLE `ts_curso`
  ADD PRIMARY KEY (`codigo`);

--
-- Indexes for table `ts_materia`
--
ALTER TABLE `ts_materia`
  ADD PRIMARY KEY (`codigo`);

--
-- Indexes for table `ts_matricula`
--
ALTER TABLE `ts_matricula`
  ADD PRIMARY KEY (`codigo`);

--
-- Indexes for table `ts_professor`
--
ALTER TABLE `ts_professor`
  ADD PRIMARY KEY (`codigo`);

--
-- Indexes for table `ts_prof_mate`
--
ALTER TABLE `ts_prof_mate`
  ADD PRIMARY KEY (`codigo`);

--
-- Indexes for table `ts_prova`
--
ALTER TABLE `ts_prova`
  ADD PRIMARY KEY (`codigo`);

--
-- Indexes for table `ts_provasavaliadas`
--
ALTER TABLE `ts_provasavaliadas`
  ADD PRIMARY KEY (`codigo`);

--
-- Indexes for table `ts_provasfinalizadas`
--
ALTER TABLE `ts_provasfinalizadas`
  ADD PRIMARY KEY (`codigo`);

--
-- Indexes for table `ts_secretario`
--
ALTER TABLE `ts_secretario`
  ADD PRIMARY KEY (`codigo`);

--
-- Indexes for table `ts_usuarios`
--
ALTER TABLE `ts_usuarios`
  ADD PRIMARY KEY (`codigo`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `ts_aluno`
--
ALTER TABLE `ts_aluno`
  MODIFY `codigo` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ts_curso`
--
ALTER TABLE `ts_curso`
  MODIFY `codigo` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ts_materia`
--
ALTER TABLE `ts_materia`
  MODIFY `codigo` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ts_matricula`
--
ALTER TABLE `ts_matricula`
  MODIFY `codigo` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ts_professor`
--
ALTER TABLE `ts_professor`
  MODIFY `codigo` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ts_prof_mate`
--
ALTER TABLE `ts_prof_mate`
  MODIFY `codigo` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ts_prova`
--
ALTER TABLE `ts_prova`
  MODIFY `codigo` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ts_provasavaliadas`
--
ALTER TABLE `ts_provasavaliadas`
  MODIFY `codigo` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ts_provasfinalizadas`
--
ALTER TABLE `ts_provasfinalizadas`
  MODIFY `codigo` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ts_secretario`
--
ALTER TABLE `ts_secretario`
  MODIFY `codigo` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ts_usuarios`
--
ALTER TABLE `ts_usuarios`
  MODIFY `codigo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
