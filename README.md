# Finance Tracker

A simple, full-stack Ruby on Rails finance tracker for managing personal expenses.  
Uses PostgreSQL as the database and Tailwind CSS for styling.

## Tech Stack

- **Full Stack**: Ruby on Rails 8
- **Database**: PostgreSQL
- **Frontend Styling**: Tailwind CSS
- **Authentication**: Devise
- **Testing**: RSpec, FactoryBot, Shoulda-Matchers
- **Email Testing**: Letter Opener

## Quick Start

1. **Clone the repository**:
   ```
   git clone git@github.com:cbanlawi/finance_tracker.git
   cd finance_tracker
   ```

2. **Install dependencies**:
   ```
   bundle install
   ```

3. **Set up the database**:

   Ensure PostgreSQL is Running

   Start PostgreSQL using Homebrew (macOS):
   ```
   brew services start postgresql
   ```

   Check if it’s running:
   ```
   brew services list
   ```
   Look for postgresql with a `started` status. If it’s `stopped`, run the start command above.

   Create and Migrate the Database:
   ```
   rails db:create db:migrate
   ```

4. **Run the App**:
   ```
   rails s
   ```

5. **User Authentication**:
   
   This app uses **Devise** for user authentication. You can register, log in, and log out to manage access to the app.

7. **Testing**:
   
   This project uses **RSpec** for testing, and **FactoryBot** and **Shoulda-Matchers** for generating test data and simplifying model testing.
   Run the test suite with:
   ```
   bundle exec rspec
   ```

8. **Notion Documentation**:

   For more detailed documentation on the setup and configuration of this app, please visit the [Finance Tracker Notion Documentation](https://light-driver-b33.notion.site/Finance-Tracker-Documentation-18707c67d974801bb2c1fb6d2bda4c12).
