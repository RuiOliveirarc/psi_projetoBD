-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 08-Dez-2020 às 10:46
-- Versão do servidor: 10.4.11-MariaDB
-- versão do PHP: 7.4.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `encomendas`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `categorias`
--

CREATE TABLE `categorias` (
  `id_categoria` int(11) NOT NULL,
  `designacao` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `icone` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `categorias`
--

INSERT INTO `categorias` (`id_categoria`, `designacao`, `icone`, `updated_at`, `created_at`) VALUES
(1, 'Informática', NULL, '2020-11-05 12:49:31', '2020-11-05 12:49:31'),
(2, 'TV', NULL, '2020-11-05 12:49:31', '2020-11-05 12:49:31'),
(3, 'Gamming', NULL, '2020-11-05 13:11:34', '2020-11-05 13:16:28'),
(4, 'Fotografia', NULL, '2020-11-05 13:11:34', '2020-11-05 13:11:34'),
(5, 'Mobile', NULL, '2020-11-05 13:12:24', '2020-11-05 13:16:35');

-- --------------------------------------------------------

--
-- Estrutura da tabela `categorias_fornecedores`
--

CREATE TABLE `categorias_fornecedores` (
  `id_cat_for` int(11) NOT NULL,
  `id_categoria` int(11) NOT NULL,
  `id_fornecedor` int(11) NOT NULL,
  `observacoes` varchar(255) NOT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `categorias_fornecedores`
--

INSERT INTO `categorias_fornecedores` (`id_cat_for`, `id_categoria`, `id_fornecedor`, `observacoes`, `updated_at`, `created_at`) VALUES
(1, 1, 1, 'a', NULL, NULL),
(2, 1, 2, 'b', NULL, NULL),
(3, 3, 3, 'c', NULL, NULL),
(4, 3, 4, 'd', NULL, NULL),
(5, 4, 5, 'e', NULL, NULL);

-- --------------------------------------------------------

--
-- Estrutura da tabela `categorias_produtos`
--

CREATE TABLE `categorias_produtos` (
  `id_cat_prod` int(11) NOT NULL,
  `id_categoria` int(11) NOT NULL,
  `id_produto` int(11) NOT NULL,
  `observacoes` varchar(255) NOT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `categorias_produtos`
--

INSERT INTO `categorias_produtos` (`id_cat_prod`, `id_categoria`, `id_produto`, `observacoes`, `updated_at`, `created_at`) VALUES
(1, 1, 1, 'a', NULL, NULL),
(2, 2, 2, 'b', NULL, NULL),
(3, 3, 3, 'c', NULL, NULL),
(4, 4, 4, 'd', NULL, NULL),
(5, 5, 4, 'e', NULL, NULL);

-- --------------------------------------------------------

--
-- Estrutura da tabela `encomendas`
--

CREATE TABLE `encomendas` (
  `id_encomenda` int(11) NOT NULL,
  `designacao` varchar(50) NOT NULL,
  `observacoes` varchar(255) NOT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `encomendas`
--

INSERT INTO `encomendas` (`id_encomenda`, `designacao`, `observacoes`, `updated_at`, `created_at`) VALUES
(1, 'e1', 'a', NULL, NULL),
(2, 'e2', 'b', NULL, NULL),
(3, 'e3', 'c', NULL, NULL),
(4, 'e4', 'd', NULL, NULL);

-- --------------------------------------------------------

--
-- Estrutura da tabela `encomendas_produtos`
--

CREATE TABLE `encomendas_produtos` (
  `id_enc_prod` int(11) NOT NULL,
  `id_produto` int(11) NOT NULL,
  `id_encomenda` int(11) NOT NULL,
  `quantidade` int(11) DEFAULT 0,
  `preco` double DEFAULT 0,
  `desconto` double DEFAULT 0,
  `obervacoes` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Extraindo dados da tabela `encomendas_produtos`
--

INSERT INTO `encomendas_produtos` (`id_enc_prod`, `id_produto`, `id_encomenda`, `quantidade`, `preco`, `desconto`, `obervacoes`, `updated_at`, `created_at`) VALUES
(1, 1, 1, 2, 1.5, 0, NULL, '2020-12-02 00:00:00', '2020-12-31 00:00:00'),
(2, 2, 1, 3, 10.5, 0, NULL, '2020-12-03 00:00:00', '2020-12-25 00:00:00'),
(3, 3, 3, 3, 11.5, 0, NULL, '2020-12-11 00:00:00', '2020-12-22 00:00:00'),
(4, 4, 4, 2, 21.5, 0, NULL, '2020-12-03 00:00:00', '2020-12-31 00:00:00');

-- --------------------------------------------------------

--
-- Estrutura da tabela `encomendas_vendedores`
--

CREATE TABLE `encomendas_vendedores` (
  `id_enc_vend` int(11) NOT NULL,
  `id_encomenda` int(11) NOT NULL,
  `id_vendedor` int(11) NOT NULL,
  `observacoes` varchar(255) NOT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `encomendas_vendedores`
--

INSERT INTO `encomendas_vendedores` (`id_enc_vend`, `id_encomenda`, `id_vendedor`, `observacoes`, `updated_at`, `created_at`) VALUES
(1, 1, 1, 'a', NULL, NULL),
(2, 2, 2, 'b', NULL, NULL),
(3, 3, 3, 'c', NULL, NULL),
(4, 4, 4, 'd', NULL, NULL);

-- --------------------------------------------------------

--
-- Estrutura da tabela `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `fornecedores`
--

CREATE TABLE `fornecedores` (
  `id_fornecedor` int(11) NOT NULL,
  `nome` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `morada` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `telefone` varchar(13) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `obervacoes` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `fornecedores`
--

INSERT INTO `fornecedores` (`id_fornecedor`, `nome`, `morada`, `telefone`, `obervacoes`, `updated_at`, `created_at`) VALUES
(1, 'Oreo', 'Rua das Oreos', '923456781', NULL, '2020-11-05 12:53:20', '2020-11-05 12:53:20'),
(2, 'Nerf', 'Rua das Nerfs', '981234567', NULL, '2020-11-05 12:53:20', '2020-11-05 12:53:20'),
(3, 'IKEA', 'Rua do IKEA', '918589899', NULL, '2020-11-05 13:12:14', '2020-11-05 13:12:14'),
(4, 'Porto Editora', 'Rua do Porto Editora', '910608608', NULL, '2020-11-05 13:12:14', '2020-11-05 13:12:14'),
(5, 'Cozinhas LDA', 'Rua da Cozinha', '918589898', NULL, '2020-11-05 13:12:40', '2020-11-05 13:12:40');

-- --------------------------------------------------------

--
-- Estrutura da tabela `fornecedores_produtos`
--

CREATE TABLE `fornecedores_produtos` (
  `id_for_prod` int(11) NOT NULL,
  `id_fornecedor` int(11) DEFAULT NULL,
  `id_produto` int(11) DEFAULT NULL,
  `preco` double DEFAULT 0,
  `observacoes` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `fornecedores_produtos`
--

INSERT INTO `fornecedores_produtos` (`id_for_prod`, `id_fornecedor`, `id_produto`, `preco`, `observacoes`, `updated_at`, `created_at`) VALUES
(1, 1, 1, 100, NULL, '2020-11-05 13:02:06', '2020-11-05 13:02:06'),
(2, 1, 2, 150, NULL, '2020-11-05 13:02:22', '2020-11-05 13:02:22'),
(3, 2, 3, 100, NULL, '2020-11-05 13:20:52', '2020-11-05 13:20:52'),
(4, 2, 4, 150, NULL, '2020-11-05 13:21:00', '2020-11-05 13:21:00');

-- --------------------------------------------------------

--
-- Estrutura da tabela `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `produtos`
--

CREATE TABLE `produtos` (
  `id_produto` int(11) NOT NULL,
  `designacao` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `stock` int(9) DEFAULT 0,
  `preco` double DEFAULT 0,
  `id_categoria` int(11) DEFAULT NULL,
  `observacoes` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Extraindo dados da tabela `produtos`
--

INSERT INTO `produtos` (`id_produto`, `designacao`, `stock`, `preco`, `id_categoria`, `observacoes`, `updated_at`, `created_at`) VALUES
(1, 'TV LG', 100, 150, 2, NULL, '2020-12-02 00:00:00', '2020-12-02 00:00:00'),
(2, 'TV SONY', 200, 50, 2, NULL, '2020-12-25 00:00:00', '2020-12-31 00:00:00'),
(3, 'PC ASUS', 50, 250, 1, NULL, '2020-12-04 00:00:00', '2020-12-30 00:00:00'),
(4, 'Apple iPhone', 200, 1000, 5, NULL, '2020-12-02 00:00:00', '2020-12-31 00:00:00');

-- --------------------------------------------------------

--
-- Estrutura da tabela `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `vendedores`
--

CREATE TABLE `vendedores` (
  `id_vendedor` int(11) NOT NULL,
  `nome` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `especialidade` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `vendedores`
--

INSERT INTO `vendedores` (`id_vendedor`, `nome`, `especialidade`, `email`, `updated_at`, `created_at`) VALUES
(1, 'Manuel Pacheco', 'Eletrónica', 'mpacheco@Gmail.com', '2020-11-05 00:00:00', '2020-11-05 00:00:00'),
(2, 'Noé Silva', 'Informática', 'nsilva@gmail.com', '2020-11-05 00:00:00', '2020-11-05 00:00:00'),
(3, 'Luís Gomes', 'Fotografia', 'lgomes', '2020-11-05 00:00:00', '2020-11-05 00:00:00'),
(4, 'António Filipe', 'Informática', 'afilipe@gmail.com', '2020-11-05 00:00:00', '2020-11-05 00:00:00'),
(5, 'Tiago Machado', 'Informática', 'tmachado@gmail.com', '2020-11-05 00:00:00', '2020-11-05 00:00:00');

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `categorias`
--
ALTER TABLE `categorias`
  ADD PRIMARY KEY (`id_categoria`);

--
-- Índices para tabela `categorias_fornecedores`
--
ALTER TABLE `categorias_fornecedores`
  ADD PRIMARY KEY (`id_cat_for`),
  ADD KEY `id_categoria` (`id_categoria`,`id_fornecedor`),
  ADD KEY `id_fornecedor` (`id_fornecedor`);

--
-- Índices para tabela `categorias_produtos`
--
ALTER TABLE `categorias_produtos`
  ADD PRIMARY KEY (`id_cat_prod`),
  ADD KEY `id_categoria` (`id_categoria`,`id_produto`),
  ADD KEY `id_produto` (`id_produto`);

--
-- Índices para tabela `encomendas`
--
ALTER TABLE `encomendas`
  ADD PRIMARY KEY (`id_encomenda`);

--
-- Índices para tabela `encomendas_produtos`
--
ALTER TABLE `encomendas_produtos`
  ADD PRIMARY KEY (`id_enc_prod`),
  ADD KEY `id_produto` (`id_produto`,`id_encomenda`),
  ADD KEY `id_encomenda` (`id_encomenda`);

--
-- Índices para tabela `encomendas_vendedores`
--
ALTER TABLE `encomendas_vendedores`
  ADD PRIMARY KEY (`id_enc_vend`),
  ADD KEY `id_encomenda` (`id_encomenda`,`id_vendedor`),
  ADD KEY `id_vendedor` (`id_vendedor`);

--
-- Índices para tabela `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Índices para tabela `fornecedores`
--
ALTER TABLE `fornecedores`
  ADD PRIMARY KEY (`id_fornecedor`);

--
-- Índices para tabela `fornecedores_produtos`
--
ALTER TABLE `fornecedores_produtos`
  ADD PRIMARY KEY (`id_for_prod`),
  ADD KEY `id_fornecedor` (`id_fornecedor`,`id_produto`),
  ADD KEY `id_produto` (`id_produto`);

--
-- Índices para tabela `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Índices para tabela `produtos`
--
ALTER TABLE `produtos`
  ADD PRIMARY KEY (`id_produto`);

--
-- Índices para tabela `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Índices para tabela `vendedores`
--
ALTER TABLE `vendedores`
  ADD PRIMARY KEY (`id_vendedor`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `categorias_fornecedores`
--
ALTER TABLE `categorias_fornecedores`
  MODIFY `id_cat_for` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de tabela `categorias_produtos`
--
ALTER TABLE `categorias_produtos`
  MODIFY `id_cat_prod` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de tabela `encomendas`
--
ALTER TABLE `encomendas`
  MODIFY `id_encomenda` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de tabela `encomendas_produtos`
--
ALTER TABLE `encomendas_produtos`
  MODIFY `id_enc_prod` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de tabela `encomendas_vendedores`
--
ALTER TABLE `encomendas_vendedores`
  MODIFY `id_enc_vend` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de tabela `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `produtos`
--
ALTER TABLE `produtos`
  MODIFY `id_produto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de tabela `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `vendedores`
--
ALTER TABLE `vendedores`
  MODIFY `id_vendedor` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `categorias_fornecedores`
--
ALTER TABLE `categorias_fornecedores`
  ADD CONSTRAINT `categorias_fornecedores_ibfk_1` FOREIGN KEY (`id_fornecedor`) REFERENCES `fornecedores` (`id_fornecedor`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `categorias_fornecedores_ibfk_2` FOREIGN KEY (`id_categoria`) REFERENCES `categorias` (`id_categoria`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limitadores para a tabela `categorias_produtos`
--
ALTER TABLE `categorias_produtos`
  ADD CONSTRAINT `categorias_produtos_ibfk_1` FOREIGN KEY (`id_produto`) REFERENCES `produtos` (`id_produto`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `categorias_produtos_ibfk_2` FOREIGN KEY (`id_categoria`) REFERENCES `categorias` (`id_categoria`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limitadores para a tabela `encomendas_produtos`
--
ALTER TABLE `encomendas_produtos`
  ADD CONSTRAINT `encomendas_produtos_ibfk_1` FOREIGN KEY (`id_produto`) REFERENCES `produtos` (`id_produto`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `encomendas_produtos_ibfk_2` FOREIGN KEY (`id_encomenda`) REFERENCES `encomendas` (`id_encomenda`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limitadores para a tabela `encomendas_vendedores`
--
ALTER TABLE `encomendas_vendedores`
  ADD CONSTRAINT `encomendas_vendedores_ibfk_1` FOREIGN KEY (`id_vendedor`) REFERENCES `vendedores` (`id_vendedor`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `encomendas_vendedores_ibfk_2` FOREIGN KEY (`id_encomenda`) REFERENCES `encomendas` (`id_encomenda`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limitadores para a tabela `fornecedores_produtos`
--
ALTER TABLE `fornecedores_produtos`
  ADD CONSTRAINT `fornecedores_produtos_ibfk_1` FOREIGN KEY (`id_fornecedor`) REFERENCES `fornecedores` (`id_fornecedor`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fornecedores_produtos_ibfk_2` FOREIGN KEY (`id_produto`) REFERENCES `produtos` (`id_produto`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
