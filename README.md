# **URL Shortener**
The URL Shortener application is a web-based service designed to help users generate short and shareable URLs from longer links. In addition to providing shortened URLs, the application also tracks usage statistics, such as the number of clicks, originating geolocation, and timestamp for each visit to a short URL.

## **1. Installation Guide**
Follow these steps to install and run the URL Shortener application:
### Prerequisites
- [Git](https://git-scm.com/)
- [Node.js](https://nodejs.org/en) (version 14.x or higher)
- [Ruby](https://www.ruby-lang.org/en/) (version 3.x or higher)
- [Rails](https://rubyonrails.org/) (version 7.x or higher)
- [PostgreSQL](https://www.postgresql.org/) (version 9.x or higher)

### Steps
1. Clone the repository into local machine using the following git command:
    ```
    git clone https://github.com/JacksonTai/url-shortener.git
    ```

2. Change directory to `url-shortener` and install the dependencies:
    ```
    cd url-shortener
    bundle install
    ```

3. Setup the database creation and migration using the following rails commands separately:
    ```
    rails db:create
    ```

    ```
    rails db:migrate
    ```

4. Start the web server using the following rails command:
    ```
    rails server
    ```

## **2. Dependencies**
The URL Shortener application relies on the following dependencies (Gem):
- [nokogiri](https://github.com/sparklemotion/nokogiri): HTML/XML parser and searcher 
- [geocoder](https://github.com/alexreisner/geocoder): Complete geocoding solution for Ruby
- [rspec-rails](https://github.com/rspec/rspec-rails):  RSpec testing framework for Rails 5+
- [factory_bot_rails](https://github.com/thoughtbot/factory_bot_rails): Test data creation library for Rails

## **3. Running Test Suite**
The test suite includes test cases for models, run the test suite using the following command:
```
rspec models
```
This command will run all tests for models using the 
[rspec-rails](https://github.com/rspec/rspec-rails) and display the test results in the terminal.
