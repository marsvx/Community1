CREATE TABLE User (
    userId SERIAL PRIMARY KEY,
    email VARCHAR(150) UNIQUE NOT NULL,
    userName NOT NULL,
    firstName VARCHAR(50), --not sure if we actually want this field
    ageRange Age_Range NOT NULL, --Uses ENUM type for fixed ranges
    hashedPasswd VARCHAR(150),
    zipCode INTEGER,
    userType User_Type NOT NULL --Uses ENUM type for type of user
);

-- Create fixed age range as ENUM
CREATE TYPE Age_Range AS ENUM (); --e.g. 0-18, 19-24, 25-34

--Create fixed user types as ENUM
CREATE TYPE User_Type AS ENUM ('REG', 'ORG', 'ADMIN');

CREATE TABLE Favorite (
    favoriteId SERIAL NOT NULL,
    userId SERIAL NOT NULL,
    organizationId  SERIAL NOT NULL,
    createdAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (favoriteId, userId, organizationId),
    FOREIGN KEY (userId) REFERENCES User(userId),
    FOREIGN KEY (organizationId) REFERENCES Organization(organizationId)
);

CREATE TABLE Dependent (
    dependentId SERIAL NOT NULL,
    userId SERIAL NOT NULL,
    nickName VARCHAR(50) NOT NULL,
    ageRange Age_Range NOT NULL,
    PRIMARY KEY (dependentId, userId),
    FOREIGN KEY (userId) REFERENCES User(userId)
);

-- TODO: Events table



--TODO: Recommendation Table



--TODO: Survey Table



-- Create question type as ENUM
CREATE TYPE question_type AS ENUM ('checkbox', 'multiple_choice', 'text', 'dropdown');

CREATE TABLE Question (
    questionId PRIMARY KEY,
    questionText TEXT,
    type question_type,
    createdAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Create category type as ENUM
CREATE TYPE category_type AS ENUM ('housing', 'food', 'legal', 'healthcare', 'education', 'child care');

CREATE TABLE Organization (
    organizationId SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    street VARCHAR(255),
    city VARCHAR(100),
    state VARCHAR(2) NOT NULL CHECK (state = 'CO')
    zipcode VARCHAR(20),
    category VARCHAR(100),
    email VARCHAR(255),
    phoneNumber VARCHAR(20),
    webLink VARCHAR(255),
    servicesSummary TEXT,
    createdAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP, 
    avgStarValue DECIMAL(3, 2)
);

-- This is a function to update the updateAt field when a change occurs to Organization table
CREATE OR REPLACE FUNCTION update_updated_at_column()
RETURNS TRIGGER AS $$
BEGIN
   NEW.updatedAt = NOW();
   RETURN NEW;
END;
$$ language 'plpgsql';

-- Trigger for changes to any row of the Organization table
CREATE TRIGGER update_organization_updated_at BEFORE UPDATE
ON Organization FOR EACH ROW EXECUTE FUNCTION update_updated_at_column();





-- TODO: Review Table



--TODO: Category table



-- ReviewComment table
