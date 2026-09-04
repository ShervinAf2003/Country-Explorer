# Country Explorer 🌍

A simple country search web application built with **Node.js, Express, PostgreSQL, EJS, and Axios**.

The user enters a country name, the application searches for it in PostgreSQL, then retrieves and displays the country's flag from an external API.

## Features

- Search countries by name
- PostgreSQL database lookup
- Parameterized SQL query
- Country flag fetched from an external API
- Server-side rendering with EJS
- Responsive design
- Environment variables for database credentials

## Technologies

- Node.js
- Express
- PostgreSQL
- EJS
- Axios
- HTML / CSS

## Project structure

```text
Country-Explorer/
├── public/
│   └── styles/
│       └── main.css
├── views/
│   └── index.ejs
├── .env.example
├── .gitignore
├── database.sql
├── index.js
├── package.json
└── package-lock.json
```

## Requirements

- Node.js 20+ (Node.js 22+ recommended)
- PostgreSQL

## Installation

### 1. Clone the repository

```bash
git clone https://github.com/ShervinAf2003/Country-Explorer.git
cd Country-Explorer
```

### 2. Install dependencies

```bash
npm install
```

### 3. Create the PostgreSQL database

Create a database named `countries`, then run `database.sql` inside it.

For example:

```bash
psql -U postgres -d countries -f database.sql
```

### 4. Configure environment variables

Copy `.env.example` to `.env` and set your PostgreSQL password.

**Never commit `.env` to GitHub.**

### 5. Start the application

```bash
npm start
```

Then open `http://localhost:3000`.

## API

Country flag data is requested from:

```text
https://countries.dev/
```

## Security

Database credentials are stored in environment variables rather than source code. The country search uses a parameterized PostgreSQL query to help prevent SQL injection.

## License

ISC
