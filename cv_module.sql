-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Czas generowania: 21 Lut 2023, 12:51
-- Wersja serwera: 10.4.27-MariaDB
-- Wersja PHP: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Baza danych: `cv_module`
--

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `user_data_job`
--

CREATE TABLE `user_data_job` (
  `id_job` int(11) NOT NULL,
  `employer` varchar(60) DEFAULT NULL,
  `first_day_of_work` date DEFAULT NULL,
  `last_day_of_work` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_polish_ci;

--
-- Zrzut danych tabeli `user_data_job`
--

INSERT INTO `user_data_job` (`id_job`, `employer`, `first_day_of_work`, `last_day_of_work`) VALUES
(1, 'firma1', '2023-02-06', '2023-03-30');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `user_education`
--

CREATE TABLE `user_education` (
  `id_education` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `first_day` date DEFAULT NULL,
  `last_day` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_polish_ci;

--
-- Zrzut danych tabeli `user_education`
--

INSERT INTO `user_education` (`id_education`, `name`, `first_day`, `last_day`) VALUES
(1, 'Liceum Ogólnokształcące w Krakowie ', '2017-09-01', '2021-06-30');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `user_login`
--

CREATE TABLE `user_login` (
  `id_user` int(11) NOT NULL,
  `login` varchar(30) DEFAULT NULL,
  `pass` varchar(40) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_polish_ci;

--
-- Zrzut danych tabeli `user_login`
--

INSERT INTO `user_login` (`id_user`, `login`, `pass`) VALUES
(1, 'test', 'a94a8fe5ccb19ba61c4c0873d391e987982fbbd3');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `user_personal_data`
--

CREATE TABLE `user_personal_data` (
  `id_data_user` int(11) NOT NULL,
  `id_job` int(11) NOT NULL,
  `id_education` int(11) NOT NULL,
  `id_login` int(11) NOT NULL,
  `name` varchar(60) DEFAULT NULL,
  `surname` varchar(60) DEFAULT NULL,
  `phone_number` varchar(12) DEFAULT NULL,
  `mail` varchar(60) DEFAULT NULL,
  `photo` text NOT NULL COMMENT 'zdjęcie jako link '
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_polish_ci;

--
-- Zrzut danych tabeli `user_personal_data`
--

INSERT INTO `user_personal_data` (`id_data_user`, `id_job`, `id_education`, `id_login`, `name`, `surname`, `phone_number`, `mail`, `photo`) VALUES
(1, 1, 1, 1, 'Name_test', 'Surname_test', '+48456789432', 'an@np.pl', '');

--
-- Indeksy dla zrzutów tabel
--

--
-- Indeksy dla tabeli `user_data_job`
--
ALTER TABLE `user_data_job`
  ADD PRIMARY KEY (`id_job`);

--
-- Indeksy dla tabeli `user_education`
--
ALTER TABLE `user_education`
  ADD PRIMARY KEY (`id_education`);

--
-- Indeksy dla tabeli `user_login`
--
ALTER TABLE `user_login`
  ADD PRIMARY KEY (`id_user`);

--
-- Indeksy dla tabeli `user_personal_data`
--
ALTER TABLE `user_personal_data`
  ADD PRIMARY KEY (`id_data_user`),
  ADD KEY `id_job` (`id_job`),
  ADD KEY `id_education` (`id_education`),
  ADD KEY `id_login` (`id_login`);

--
-- AUTO_INCREMENT dla zrzuconych tabel
--

--
-- AUTO_INCREMENT dla tabeli `user_data_job`
--
ALTER TABLE `user_data_job`
  MODIFY `id_job` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT dla tabeli `user_education`
--
ALTER TABLE `user_education`
  MODIFY `id_education` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT dla tabeli `user_login`
--
ALTER TABLE `user_login`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT dla tabeli `user_personal_data`
--
ALTER TABLE `user_personal_data`
  MODIFY `id_data_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Ograniczenia dla zrzutów tabel
--

--
-- Ograniczenia dla tabeli `user_personal_data`
--
ALTER TABLE `user_personal_data`
  ADD CONSTRAINT `user_personal_data_ibfk_1` FOREIGN KEY (`id_education`) REFERENCES `user_education` (`id_education`),
  ADD CONSTRAINT `user_personal_data_ibfk_2` FOREIGN KEY (`id_job`) REFERENCES `user_data_job` (`id_job`),
  ADD CONSTRAINT `user_personal_data_ibfk_3` FOREIGN KEY (`id_login`) REFERENCES `user_login` (`id_user`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
