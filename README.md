### Steps to Set Up and Run Laravel Project:

1. **Clone the Repository:**
    - Clone the Laravel project repository from GitHub to your local machine.
      ```bash
      git clone git@github.com:xplodman/Perfect-food.git
      ```

2. **Navigate to the Project Directory:**
    - Change your current directory to the one where you cloned the repository.
      ```bash
      cd Perfect-food
      ```

3. **Install Composer Dependencies:**
    - Composer is a dependency manager for PHP. Install all the PHP dependencies required by the Laravel project.
      ```bash
      composer install
      ```

4. **Install NPM Dependencies:**
    - NPM is a package manager for JavaScript. Install all the JavaScript dependencies required by the Laravel project.
      ```bash
      npm install
      ```

5. **Copy the Environment File:**
    - Laravel uses an .env file to manage environment-specific configurations. Create a copy of the .env.example file as .env, which you can then customize for your local environment.
      ```bash
      cp .env.example .env
      ```

6. **Generate Application Key:**
    - Laravel requires an application key for encryption purposes. Generate a new application key and update it in your .env file.
      ```bash
      php artisan key:generate
      ```

7. **Update Environment Variables:**
    - Open the .env file in a text editor and update the environment variables as per your local environment setup. This includes database connection details and other configurations.

8. **Run Migrations with Seeding:**
    - Laravel migrations are used to create and modify database tables. This command runs all the migrations and seeds the database with initial data.
      ```bash
      php artisan migrate:fresh --seed
      ```

9. **Compile Assets:**
    - Laravel Mix is a tool for compiling assets like JavaScript and CSS. This command compiles these assets based on the configurations defined in the webpack.mix.js file.
      ```bash
      npm run dev
      ```

10. **Serve the Application:**
    - Start the Laravel development server to serve your application locally.
      ```bash
      php artisan serve
      ```

11. **Accessing the Application:**
    - Once the php artisan serve command is executed, you can access your Laravel application through a web browser by navigating to the URL provided.

12. **Log in with User Credentials:**
    - Use the following credentials to log in:
        - Email: admin@Perfect-food.localhost
        - Password: P@ssw0rd
