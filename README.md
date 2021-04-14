# Stay In Touch Application 
![](https://img.shields.io/badge/Microverse-blueviolet)

> This repo includes initial code for social media app with basic styling.
The purpose of this project is to build a social media application that allows users to send friendship requests, create a post, make comments on a related post, and put likes to own and the other users' posts. 

## Built With

* Ruby 3.0
* Rais 6
* PostgreSQL

## Getting Started

**To clone and run the application locally, use the following steps:**
- On Github, on the main page of the private-event repository, click ![the Code button](images/code.png) and copy "Clone with HTTPS" by clicking ![the copy icon](images/copy.png).
- In your terminal, enter a `git clone` and past the link that you copied from the repository, and press the `Enter`
(e.g. git clone https://github.com/gdumani/private-events.git).
- Navigate to the project folder using `cd folder_name`
- To install all dependencies, run `bundle install`
- To create a database, run `db:create`
- To migrate the schema, run `db:migrate`
- Now, you can run your application using the `rails s` command.
- To verify the connection [Visit localhost:3000](http://localhost:3000 ).

## Associations
Polymorphic association build relationship with other models on a single association.
 For example, in this project, we defined the polymorphic association between the Comment model and other models like Post and User. Furthermore, we identified a Self-join association between the user and his friend. The database design for building social network applications that demonstrated in the diagram below. 

## Database design
![Database diagram](images/db_diagram.png) 

## Authors

**Giancarlo Dumani**

- GitHub: [@gdumani](https://github.com/gdumani)
- Twitter: [@gdumani1](https://twitter.com/gdumani1)
- LinkedIn: [ Giancarlo-Dumani](https://www.linkedin.com/in/gdumani/?originalSubdomain=cr)

**Mina**

- GitHub: [@Takhmina175](https://github.com/Takhmina175)
- Twitter: [@Takhmin73630110](https://twitter.com/Takhmin73630110)
- LinkedIn: [Takhmina Makhkamova](https://www.linkedin.com/in/takhmina-makhkamova-7628136b/)



## Show your support

Give a ⭐️ if you like this project!

## License

This project is [MIT](./LICENSE) licensed.

## Acknowledgements

- [Microverse](https://microverse.org)
