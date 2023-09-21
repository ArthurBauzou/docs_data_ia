-- AFFICHER TOUS LES PRÉNOMS

SELECT first_name
FROM Customers;

-- Afficher tous les noms pour le pays UK (where)

SELECT first_name, last_name
FROM Customers
WHERE country = 'UK';

-- Afficher l'âge des gens qui vivent aux USA et dont le prénom est robert (and)

SELECT age
FROM Customers
WHERE country = 'USA'
AND first_name = 'Robert';

-- Afficher combien il y a de moniteur dans la table orders

SELECT amount
FROM Orders
WHERE item = 'Monitor';

-- Afficher le nombre de client (COUNT())

SELECT COUNT(customer_id) AS Nbr_Clients
FROM Customers;

-- Afficher l'âge moyen des clients (AVG())

SELECT AVG(age) AS Âge_Moyen
FROM Customers;

-- JOINTURES --
-- Afficher les commandes de chaque user

SELECT  C.first_name AS Prénom, 
		C.last_name AS Nom,
        O.amount AS Quantité,
        O.item AS Qualité
FROM Customers AS C
INNER JOIN Orders AS O
ON C.customer_id = O.customer_id;

-- Affciher toutes les commandes en attentes avec la quantité et le pays de destination

SELECT  S.shipping_id AS 'N° de commande en attente',
		O.item AS Produit,
		--S.status,
		C.last_name AS Nom,
        C.country AS Destination
FROM Shippings AS S
LEFT JOIN Orders AS O
ON S.customer = O.customer_id
JOIN Customers AS C
ON S.Customer = C.Customer_id
WHERE S.status = 'Pending'
  -- AND S.Customer = C.Customer_id