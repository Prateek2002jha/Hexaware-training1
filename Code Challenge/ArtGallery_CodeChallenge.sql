use ArtGalleryCodeChallenge

-- Create the Artists table
CREATE TABLE Artists (
 ArtistID INT PRIMARY KEY,
 Name VARCHAR(255) NOT NULL,
 Biography TEXT,
 Nationality VARCHAR(100));


-- Create the Categories table
CREATE TABLE Categories (
 CategoryID INT PRIMARY KEY,
 Name VARCHAR(100) NOT NULL);


-- Create the Artworks table
CREATE TABLE Artworks (
 ArtworkID INT PRIMARY KEY,
 Title VARCHAR(255) NOT NULL,
 ArtistID INT,
 CategoryID INT,
 Year INT,
 Description TEXT,
 ImageURL VARCHAR(255),
 FOREIGN KEY (ArtistID) REFERENCES Artists (ArtistID),
 FOREIGN KEY (CategoryID) REFERENCES Categories (CategoryID));


-- Create the Exhibitions table
CREATE TABLE Exhibitions (
 ExhibitionID INT PRIMARY KEY,
 Title VARCHAR(255) NOT NULL,
 StartDate DATE,
 EndDate DATE,
 Description TEXT);


-- Create a table to associate artworks with exhibitions
CREATE TABLE ExhibitionArtworks (
 ExhibitionID INT,
 ArtworkID INT,
 PRIMARY KEY (ExhibitionID, ArtworkID),
 FOREIGN KEY (ExhibitionID) REFERENCES Exhibitions (ExhibitionID),
 FOREIGN KEY (ArtworkID) REFERENCES Artworks (ArtworkID));



 -- DML(INSERT SAMPLE DATA TO TABLES)

 -- Insert sample data into the Artists table
INSERT INTO Artists (ArtistID, Name, Biography, Nationality) VALUES
 (1, 'Pablo Picasso', 'Renowned Spanish painter and sculptor.', 'Spanish'),
 (2, 'Vincent van Gogh', 'Dutch post-impressionist painter.', 'Dutch'),
 (3, 'Leonardo da Vinci', 'Italian polymath of the Renaissance.', 'Italian');


 -- Insert sample data into the Categories table
INSERT INTO Categories (CategoryID, Name) VALUES
 (1, 'Painting'),
 (2, 'Sculpture'),
 (3, 'Photography');


 -- Insert sample data into the Artworks table
INSERT INTO Artworks (ArtworkID, Title, ArtistID, CategoryID, Year, Description, ImageURL) VALUES
 (1, 'Starry Night', 2, 1, 1889, 'A famous painting by Vincent van Gogh.', 'starry_night.jpg'),
 (2, 'Mona Lisa', 3, 1, 1503, 'The iconic portrait by Leonardo da Vinci.', 'mona_lisa.jpg'),
 (3, 'Guernica', 1, 1, 1937, 'Pablo Picasso\s powerful anti-war mural.', 'guernica.jpg');

 -- Insert sample data into the Exhibitions table
INSERT INTO Exhibitions (ExhibitionID, Title, StartDate, EndDate, Description) VALUES
 (1, 'Modern Art Masterpieces', '2023-01-01', '2023-03-01', 'A collection of modern art masterpieces.'),
 (2, 'Renaissance Art', '2023-04-01', '2023-06-01', 'A showcase of Renaissance art treasures.');


 --Insert artworks into exhibitions
INSERT INTO ExhibitionArtworks (ExhibitionID, ArtworkID) VALUES
 (1, 1),
 (1, 2),
 (1, 3),
 (2, 2);


 --- Solving the queries

 --1. Retrieve the names of all artists along with the number of artworks they have in the gallery, and
--list them in descending order of the number of artworks.select a.name as ArtisName,count(art.ArtworkID) as NumberOfArtworksfrom Artists aleft join Artworks art on a.ArtistID = art.ArtistIDgroup by a.ArtistID, a.Nameorder by NumberOfArtworks desc;--2. List the titles of artworks created by artists from 'Spanish' and 'Dutch' nationalities, and order
--them by the year in ascending orderselect Art.Title, Art.Year  
from Artworks Art  
join Artists A on Art.ArtistID = A.ArtistID  
where A.Nationality in ('Spanish', 'Dutch')  
order by Art.Year asc;  
 

-- 3. Find the names of all artists who have artworks in the 'Painting' category, and the number of
--artworks they have in this category.
select A.Name, count(Art.ArtworkID) as NumberOfArtworks  
from Artists A  
join Artworks Art on A.ArtistID = Art.ArtistID  
join Categories C on Art.CategoryID = C.CategoryID  
where C.Name = 'Painting'  
group by A.ArtistID, A.Name;  
--4. List the names of artworks from the 'Modern Art Masterpieces' exhibition, along with their
--artists and categoriesselect Art.Title, A.Name as ArtistName, C.Name as CategoryName  
from Artworks Art  
join Artists A on Art.ArtistID = A.ArtistID  
join Categories C on Art.CategoryID = C.CategoryID  
join ExhibitionArtworks EA on Art.ArtworkID = EA.ArtworkID  
join Exhibitions E on EA.ExhibitionID = E.ExhibitionID  
where E.Title = 'Modern Art Masterpieces';  


--5. Find the artists who have more than two artworks in the gallery.insert into Artworks (ArtworkID, Title, ArtistID, CategoryID, Year, Description, ImageURL) values  
(4, 'The Weeping Woman', 1, 1, 1937, 'A famous painting by Picasso.', 'weeping_woman.jpg'),  
(5, 'Sunflowers', 2, 1, 1888, 'A series of paintings by Van Gogh.', 'sunflowers.jpg'),  
(6, 'Self-Portrait', 2, 1, 1889, 'A self-portrait by Van Gogh.', 'self_portrait.jpg');  
select A.Name
from Artists A
join Artworks Art on A.ArtistID= Art.ArtistID
group by A.ArtistID, A.Name
having count(Art.ArtworkID) >2;


--6. Find the titles of artworks that were exhibited in both 'Modern Art Masterpieces' and
--'Renaissance Art' exhibitions
select Art.Title  
from Artworks Art  
join ExhibitionArtworks EA1 on Art.ArtworkID = EA1.ArtworkID  
join Exhibitions E1 on EA1.ExhibitionID = E1.ExhibitionID  
join ExhibitionArtworks EA2 on Art.ArtworkID = EA2.ArtworkID  
join Exhibitions E2 on EA2.ExhibitionID = E2.ExhibitionID  
where E1.Title = 'Modern Art Masterpieces'  
and E2.Title = 'Renaissance Art';  


--7. Find the total number of artworks in each category
select c.Name as CategoryNames, count(Art.ArtworkID) as TotalArtworks
from Categories c
join Artworks Art on c.CategoryID= Art.CategoryID
group by c.CategoryID, C.name;


insert into Artworks (ArtworkID, Title, ArtistID, CategoryID, Year, Description, ImageURL) values  
(7, 'David', 3, 2, 1504, 'A sculpture by Michelangelo.', 'david.jpg'),  
(8, 'The Thinker', 3, 2, 1904, 'A sculpture by Auguste Rodin.', 'thinker.jpg'),  
(9, 'Moonrise', 2, 3, 1941, 'A famous photograph by Ansel Adams.', 'moonrise.jpg');  


-- 8. List artists who have more than 3 artworks in the gallery
select A.Name
from Artists A
join Artworks Art on A.ArtistID= Art.ArtistID
group by A.ArtistID, A.Name
having count(Art.ArtworkID) >3;

--.9. Find the artworks created by artists from a specific nationality (e.g., Spanish)
select Art.Title, Art.Year
from Artworks Art
join Artists A on Art.ArtistID= A.ArtistID
where A.Nationality='Spanish';


--10. List exhibitions that feature artwork by both Vincent van Gogh and Leonardo da Vinci.
select E.Title  
from Exhibitions E  
join ExhibitionArtworks EA on E.ExhibitionID = EA.ExhibitionID  
join Artworks Art on EA.ArtworkID = Art.ArtworkID  
join Artists A on Art.ArtistID = A.ArtistID  
where A.Name in ('Vincent van Gogh', 'Leonardo da Vinci')  
group by E.ExhibitionID, E.Title  
having count(distinct A.ArtistID) = 2;  


-- 11. Find all the artworks that have not been included in any exhibition.
select Art.Title
from Artworks Art
left join ExhibitionArtworks EA on Art.ArtworkID= EA. ArtworkID
where EA.ExhibitionID is null;

--12. List artists who have created artworks in all available categories.
select a.Name
from Artists a
join Artworks Art on a.ArtistID= Art.ArtistID
join categories c on Art.CategoryID= C.CategoryID
group by A.ArtistID, A.Name
having count(distinct Art.CategoryID)= (select count(*) from Categories);


--13. List the total number of artworks in each category.
select c.Name as CategoryName, count(Art.ArtworkID) as TotalArtworks
from Categories C
join Artworks Art on C.CategoryID= Art.CategoryID
group by C.CategoryID, C.Name;

--14. Find the artists who have more than 2 artworks in the gallery
select A.Name
from Artists A
join Artworks Art on A.ArtistID= Art.ArtistID
group by A.ArtistID, A.Name
having count(Art.ArtworkID) >2;

--15. List the categories with the average year of artworks they contain, only for categories with more
--than 1 artwork.select c.Name as CateogryName,  avg(Art.Year) as AvgYear
from Categories c
join Artworks Art on c.CategoryID= Art.CategoryID
group by c.CategoryID, c.Name
having count(Art.ArtworkID)>1


--16. Find the artworks that were exhibited in the 'Modern Art Masterpieces' exhibition.
select Art.Title
from Artworks Art
join ExhibitionArtworks EA on Art.ArtworkID= EA.ArtworkID
join Exhibitions E on EA.ExhibitionID= E.ExhibitionID
where E.Title = 'Modern Art Masterpieces';


--17. Find the categories where the average year of artworks is greater than the average year of all
--artworks.

select c.Name as CategoryName , avg(Art.Year) as AvgYear
from Categories C
join Artworks Art on c.CategoryID = Art.CategoryID
group by c.CategoryID, c.Name
having avg(Art.Year) > (select avg(Year) from Artworks);


--18. List the artworks that were not exhibited in any exhibition.

select Art.Title
from Artworks Art
left join ExhibitionArtworks EA on Art.ArtworkID = EA. ArtworkID
where EA.ExhibitionID is null;

--19. Show artists who have artworks in the same category as "Mona Lisa."
select distinct A.Name
from Artists A
join Artworks Art on A.ArtistID= Art.ArtistID
where Art.CategoryID= (
select CategoryID
from Artworks
where Title = 'Mona Lisa'
);

--20. List the names of artists and the number of artworks they have in the gallery.

select A.Name, count(Art.ArtworkID) as Totalworks
from Artists A
join Artworks Art on A.ArtistID = Art.ArtistID
group by A.ArtistID, A.Name;




