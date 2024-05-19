# HexBank API

Welcome to HexBank, a fictional bank API built with Elixir. This project marks my first venture into Elixir programming and functional programming paradigm. The application allows you to create users, manage bank accounts, and perform transactions between accounts.

## 🚀 Technologies

- **Elixir**: The main programming language used for the project.
- **Phoenix**: The web framework used to build the API.
- **Ecto**: A database wrapper and query generator for Elixir.
- **Argon2**: A password hashing library to securely store user passwords.
- **Tesla**: An HTTP client for Elixir.
- **Mox**: A library for creating mocks in Elixir.
- **Bypass**: A library for mocking HTTP servers in tests.

## 🛠️ Features

- **User Management**: Create, update, delete, and view user profiles.
- **Authentication**: Secure login functionality.
- **Bank Account Management**: Create bank accounts.
- **Transactions**: Transfer funds between accounts.

## 📑 API Routes

### Public Routes

These routes are accessible without authentication.

- **POST /api/users**: Create a new user.
- **POST /api/users/login**: Login a user.

### Authenticated Routes

These routes require authentication.

- **GET /api/users/:id**: View user profile.
- **PATCH /api/users/:id**: Update user profile.
- **DELETE /api/users/:id**: Delete user profile.
- **POST /api/accounts**: Create a new bank account.
- **POST /api/accounts/transaction**: Perform a transaction between accounts.

## 📝 Getting Started

Follow these instructions to get a copy of the project up and running on your local machine for development and testing purposes.

### Prerequisites

Ensure you have the following installed:

- Elixir
- Phoenix
- PostgreSQL

### Installation

1. **Clone the repository**:

   ```bash
   git clone https://github.com/yourusername/hexbank.git
   cd hexbank
   ```

2. **Install dependencies**:

   ```bash
   mix deps.get
   ```

3. **Set up the database**:

   ```bash
   mix ecto.create
   mix ecto.migrate
   ```

4. **Start the Phoenix server**:
   ```bash
   mix phx.server
   ```

### Running Tests

To run the tests, use the following command:

```bash
mix test
```
