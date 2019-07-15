-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Jul 15, 2019 at 06:41 PM
-- Server version: 10.1.16-MariaDB
-- PHP Version: 5.6.24

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `codingthunder`
--

-- --------------------------------------------------------

--
-- Table structure for table `contacts`
--

CREATE TABLE `contacts` (
  `sno` int(11) NOT NULL,
  `name` text NOT NULL,
  `email` varchar(50) NOT NULL,
  `phone_num` varchar(50) NOT NULL,
  `message` text NOT NULL,
  `date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `contacts`
--

INSERT INTO `contacts` (`sno`, `name`, `email`, `phone_num`, `message`, `date`) VALUES
(3, 'vinutha P', 'vinutha@gmail.com', '8618180460', 'Hello, i have a doubt about this work', '2019-06-13 20:15:47'),
(4, 'sindhu', 'sindhu@gmail.com', '4509878890', 'hello this is sindhu, i am an asshole', '2019-06-15 10:29:21'),
(8, 'bhagya', 'bhagya@gmail.com', '6655443322', 'hello bhagya here.....', '2019-06-15 11:14:44'),
(11, 'sam', 'sam@gmail.com', '4455667788', 'Hello this is sam', '2019-07-15 14:22:04'),
(15, 'sanya', 'sanya@gmail.com', '4455667788', 'ajfbjdbfnsvn mbgsdbgnbdsngbsdnm', '2019-07-15 14:30:48'),
(16, 'caleb', 'caleb@gmail.com', '7788665544', 'caleb from stranger things', '2019-07-15 14:35:29');

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `sno` int(11) NOT NULL,
  `title` text NOT NULL,
  `tagline` text NOT NULL,
  `slug` varchar(25) NOT NULL,
  `content` text NOT NULL,
  `img_file` varchar(25) NOT NULL,
  `date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`sno`, `title`, `tagline`, `slug`, `content`, `img_file`, `date`) VALUES
(4, 'Stephen Hawking', 'The Stephen Hawking Success Story: Never Give Up on Life', 'stephen-Hawking', 'Born in Oxford, England in 1942, Stephen Hawking was always scientifically inclined. He attended the prestigious University of Oxford and later while he was a graduate student at the University of Cambridge, he met his first love, Jane Wilde, who would later become his wife. He looked forward to having a normal life but fate had other plans.\r\n\r\nAt the age of 21 he was diagnosed with Motor neurone disease, a rare condition which progressive cripples the individual and usually causes death within a few years. Hawking was told he only had two years to live. While he proved the doctors wrong and survived, he was still eventually confined to a wheel chair and much of his body became paralyzed.\r\n\r\n\r\n\r\n\r\nA bout of pneumonia in 1985 almost killed him. The doctors suggested to his wife to switch off life support as they thought he would almost certainly die. But she refused. Miraculously, Hawking survived again, but a tracheotomy procedure conducted during this period robbed him of his ability to speak. Today he is only able to communicate is through a speech synthesizer in which he has to key in sentences, letter by letter by twitching his facial muscles. Due to the progressive nature of his disease, slowly it has become extremely hard for him to do that too.\r\n\r\nAnd yet despite all these problems that would make average people think their lives were doomed, Hawking had the courage to keep pursuing what he wanted. His work on theoretical physics has established him as one of most respected physicists in the world. Despite the immense struggle he faces in everyday life, Hawking has still managed to maintain a sense of humor and tries to enjoy life as much as he possibly can.', 'stephenH.jpg', '2019-07-15 21:44:14'),
(6, 'Steve Jobs', 'Steve Jobs: These are 2 essential ingredients for success', 'steve-jobs', 'Steve Jobs is an entrepreneurial legend. He famously started Apple in a garage with co-founder Steve Wozniak in 1976 after dropping out of college. The tech company has a market capitalization of $870 billion.\r\n\r\nJobs, who died of pancreatic cancer in 2011 when he was 56 years old, was revered for his vision in making computer technology elegant and consumer friendly. His legacy includes the Mac computer, the iPod, iPhone and iPad. He was also infamously caustic and was forced out of the company he founded when he clashed with the management. He returned to the company in 1997 to once again lead the business he birthed.\r\n\r\nAccording to Jobs, two things are required to build a successful company: passion and people. Jobs said so in an interview he did with Microsoft Chairman Bill Gates in 2007.\r\n\r\n“People say you have to have a lot of passion for what you’re doing and it’s totally true,” the Apple CEO said. “And the reason is because [building something of value is] so hard that if you don’t, any rational person would give up.\r\n\r\n“It’s really hard. And you have to do it over a sustained period of time. So if you don’t love it, if you’re not having fun doing it ... you’re going to give up. And that’s what happens to most people, actually,” Jobs said.\r\n\r\nIt’s one of the greatest sources of motivation, he said.', 'steveJ.jpg', '2019-07-15 21:49:54'),
(7, 'Barack Obama', 'career of Barack Obama', 'barack-obama', 'Barack Obama, the 44th President of the United States, was born on August 4, 1961 in Honolulu, Hawaii[1] to Barack Obama, Sr. (1936–1982) (born in Rachuonyo District,[2] British Kenya) and Stanley Ann Dunham, known as Ann (1942–1995) (born in Wichita, Kansas, United States).[3]\r\n\r\nBarack Obama spent most of his childhood years in Honolulu, where his mother attended the University of Hawaii at Manoa. Obama started a close relationship with his maternal grandparents. In 1965, his mother remarried to Lolo Soetoro from Indonesia. Two years later, Dunham took Obama with her to Indonesia to reunite him with his stepfather. In 1971, Obama returned to Honolulu to attend Punahou School, from which he graduated in 1979.\r\n\r\nAs a young adult, Obama moved to the contiguous United States, where he was educated at Occidental College, Columbia University, and Harvard Law School. In Chicago, Obama worked at various times as a community organizer, lawyer, Lecturer and Senior Lecturer of constitutional law at the University of Chicago Law School in the city''s South Side, and later published his memoir Dreams from My Father before beginning his political career in 1997 as a member of the Illinois Senate.', 'Bobama.jpg', '2019-07-15 21:54:17'),
(8, 'Robert Downey Jr ', 'Robert Downey Jr’s Success story', 'rdj-post', 'Robert Downey Jr. has lived a life which is a real life success testimony. From addiction to continuous failure to legendary success he has proved himself to be a real Iron Man.\r\n\r\nHe is one of the most charming Hollywood celebrities right now, also one of the highest paid. But his life was not this easy and drools worthy. He was born into an artist family and his father was a well-known actor and filmmaker. He was very interested in acting and performing arts and debuted as an actor in his father’s movie when he was 5 years old.\r\n\r\nUnfortunately, after being exposed to drugs by his father, he became a drug addict by the age eight. Heart breaking as it is, but true. He dropped out of high school to pursue acting and did small time jobs to support himself in the meantime. His struggle paid off and he earned major roles in movies and TV shows. In 1992 he got to play Charlie Chaplin for which he had to work hard and he also got an Oscar nomination for the role. He did some good works after that before his drug addiction increased and he was arrested.\r\n\r\nHe spent almost a year in correctional facility even though he was sentenced for three years. In the facility he was earning 9 cent per hour cleaning the floor. It was one of the job he did as an inmate. After the judge let him go, he returned to acting but his addiction continued. He lost some friends and got arrested time and again. Also he got fired from jobs due to the same reason. In 2003 he met his future wife Susan and decided to start a drug-free, sober life and concentrated on his work. He kept himself busy and immersed in his personal and professional commitments. He also released an album. He did almost 13 films in the next 4 years.\r\n\r\n In 2008, in Hollywood a blockbuster history was made when he was given the role of Tony Stark AKA Iron Man, his all-time favorite childhood superhero. His portrayal was widely praised among audiences as well as critics and his popularity was catapulted overnight. After that he never had to look back. He has been playing the iconic superhero since then and has created a huge fan base of his own. He is one of the richest and most influential Hollywood personalities currently. He is well settle with his family and is sober since 2003. He practices yoga and kung Fu to keep himself the way he is and credits his sanity to his wife. Robert Downey Jr. has seen the worst time of his life and has changed it, transformed it towards good. He will always be inspirational to the mass.', 'rdj.jpg', '2019-07-15 21:59:27'),
(9, 'Ellen DeGeneres', 'Ellen DeGeneres Success Story', 'Ellen-post', 'Ellen ‘Lee’ DeGeneres was born on January 26, 1958 at Metairie, Louisiana. She was described as a hyperactive kid by her parents and friends, who was always laughing and bubbling with energy. During her teens she worked as a waitress, painter, and bartender to earn some money and spend her free time more effectively. \r\n\r\nShe was able to talk in a very quirky and funny manner which prompted her to enter the stand-up comedy field. She started off by performing her short comedy acts at nearby clubs and restaurants. In 1981, she was given a chance to become the emcee at the popular Clyde’s Comedy Club situated in Orleans.\r\n\r\nShe soon progressed to tour the country with her live performances in 1982. That year she was named as Showtime’s ‘Funniest Person in America’. This was a huge honor for her as she was able to surpass many veteran male contenders to become one of the few women to have ever have won this title. She soon got many roles in films and television.\r\n\r\nn 1989, she was cast in the TV show ‘Open House’. Next she was part of the sitcom ‘Laurie Hill’ and ‘These Friends of Mine’ in which her performances were highly appreciated. Her comedy was also seen in films like ‘Coneheads’(1993), Mr. Wrong’(1996), ‘The Love Letter’(1999) and ‘Finding Nemo’(2003).', 'ellenD.jpg', '2019-07-15 22:07:26');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `contacts`
--
ALTER TABLE `contacts`
  ADD PRIMARY KEY (`sno`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`sno`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `contacts`
--
ALTER TABLE `contacts`
  MODIFY `sno` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;
--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `sno` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
