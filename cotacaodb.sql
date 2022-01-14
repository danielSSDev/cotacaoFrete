-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 11-Jan-2022 às 07:37
-- Versão do servidor: 10.4.14-MariaDB
-- versão do PHP: 7.4.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `cotacaodb`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `cotacao_fretes`
--

CREATE TABLE `cotacao_fretes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `transportadora_id` bigint(20) UNSIGNED NOT NULL,
  `uf` char(2) COLLATE utf8mb4_unicode_ci NOT NULL,
  `percentual_cotacao` decimal(10,2) NOT NULL,
  `valor_extra` decimal(10,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `cotacao_fretes`
--

INSERT INTO `cotacao_fretes` (`id`, `transportadora_id`, `uf`, `percentual_cotacao`, `valor_extra`, `created_at`, `updated_at`) VALUES
(1, 1, 'PR', '2.95', '14.35', '2022-01-08 22:12:34', '2022-01-08 22:12:34'),
(2, 1, 'SP', '2.95', '0.00', '2022-01-08 22:23:33', '2022-01-08 22:23:33'),
(3, 1, 'RJ', '14.50', '0.00', '2022-01-09 04:41:10', '2022-01-09 04:41:10'),
(4, 3, 'PR', '14.50', '2.00', '2022-01-09 05:13:46', '2022-01-09 05:13:46'),
(5, 3, 'RJ', '16.40', '5.00', '2022-01-09 05:14:05', '2022-01-09 05:14:05'),
(6, 3, 'SP', '13.10', '1.00', '2022-01-09 05:14:27', '2022-01-09 05:14:27'),
(7, 5, 'PR', '13.10', '0.00', '2022-01-09 05:16:17', '2022-01-09 05:16:17'),
(8, 5, 'SP', '15.50', '3.00', '2022-01-09 05:16:29', '2022-01-09 05:16:29'),
(9, 5, 'RJ', '16.50', '4.00', '2022-01-09 05:16:41', '2022-01-09 05:16:41'),
(10, 5, 'SC', '14.00', '0.00', '2022-01-09 05:17:14', '2022-01-09 05:17:14'),
(11, 3, 'SC', '13.10', '0.00', '2022-01-09 05:17:24', '2022-01-09 05:17:24'),
(12, 6, 'PR', '11.50', '2.00', '2022-01-09 05:19:46', '2022-01-09 05:19:46'),
(13, 6, 'SC', '12.00', '1.00', '2022-01-09 05:19:59', '2022-01-09 05:19:59'),
(14, 6, 'SP', '11.00', '3.00', '2022-01-09 05:20:08', '2022-01-09 05:20:08'),
(15, 6, 'RJ', '16.00', '3.00', '2022-01-09 05:20:14', '2022-01-09 05:20:14'),
(16, 3, 'AP', '122.00', '15.00', '2022-01-11 08:46:23', '2022-01-11 08:46:23'),
(17, 6, 'AP', '15.00', '566.00', '2022-01-11 08:50:14', '2022-01-11 08:50:14'),
(18, 5, 'AP', '25.00', '36.00', '2022-01-11 08:50:54', '2022-01-11 08:50:54'),
(19, 3, 'MG', '455.00', '25.00', '2022-01-11 08:51:56', '2022-01-11 08:51:56');

-- --------------------------------------------------------

--
-- Estrutura da tabela `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
(14, '2014_10_12_000000_create_users_table', 1),
(17, '2019_08_19_000000_create_failed_jobs_table', 2),
(22, '2022_01_07_224906_create_transportadoras_table', 3),
(23, '2022_01_08_182125_create_cotacao_fretes_table', 3);

-- --------------------------------------------------------

--
-- Estrutura da tabela `transportadoras`
--

CREATE TABLE `transportadoras` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nome` char(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `transportadoras`
--

INSERT INTO `transportadoras` (`id`, `nome`, `created_at`, `updated_at`) VALUES
(1, 'Transportadora 1', NULL, NULL),
(3, 'Transportadora 2', NULL, NULL),
(5, 'Transportadora 3', NULL, NULL),
(6, 'Transportadora 4', NULL, NULL);

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

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `cotacao_fretes`
--
ALTER TABLE `cotacao_fretes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cotacao_fretes_transportadora_id_foreign` (`transportadora_id`);

--
-- Índices para tabela `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `transportadoras`
--
ALTER TABLE `transportadoras`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `cotacao_fretes`
--
ALTER TABLE `cotacao_fretes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT de tabela `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT de tabela `transportadoras`
--
ALTER TABLE `transportadoras`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de tabela `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `cotacao_fretes`
--
ALTER TABLE `cotacao_fretes`
  ADD CONSTRAINT `cotacao_fretes_transportadora_id_foreign` FOREIGN KEY (`transportadora_id`) REFERENCES `transportadoras` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
