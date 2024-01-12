SnowTricks
====
# SnowTricks

Création d'un Portfolio-Blog

> Openclassrooms PHP/Symfony developer course project 6 : snowboard community site to learn the Symfony 4 framework.

[![Codacy Badge](https://app.codacy.com/project/badge/Grade/16c567b246e54c2badd2806a2f69af2d)](https://app.codacy.com/gh/Getssone/Portfolio-Blog/dashboard?utm_source=gh&utm_medium=referral&utm_content=&utm_campaign=Badge_grade)

## Features

- Front office accessible to all users
- Create a collaborative site to promote the sport to the general public 
- Capitalize on the content contributed by Internet users to develop rich content that arouses the interest of the site's users.

# 🔍Need

    - Registration page
        - The registration page features a form that asks for :
            - [x] username.
            - [x] email address.
            - [x] password.
        - Once this information has been entered, the user receives an email to validate the account creation and activate the account.
            - [x] via a validation token.
    - Login page
        - [x] Login is via a dedicated page with username and password.
        - [x] A "forgotten password" button redirects the user to the forgotten password page.
    - Forgotten password page
        - When the user has forgotten his/her password:
        - [x] he will be asked for his username via a form. Once entered, he will receive an email with a link to create a new password, which will take him to the password reset page.
    - Password reset page
        - [x] Once on this page, the user can enter a new password via a form.
        - [x] Once the password has been changed, the user will be redirected to the home page.
    - Home page - List of snowboard tricks
        - If the user is Annonymous
            - [x] The page is accessible to all users.
            - [x] The list of trick names is displayed.
            - [x] The user can click on a figure name to access the figure details page.
        - If the user is logged in :
            - [x] a small pen icon located next to the name which redirects the user to a figure modification form.
            - [x] a recycle garbage can next to the name to delete the figure.
    - Snowboard figure creation page
        - If the user is logged in:**
            - The form will contain the following fields:*
                - [x] name ;
                - [x] description ;
                - [x] figure group ;
                - [x] illustration(s) ;
                - [x] one or more video(s)
                    
                    <aside>
                    ℹ️ For videos, users can paste an embed tag from the platform of their choice (Youtube, Dailymotion...).
                    
                    </aside>
                    
            - When the user submits the form, the following conditions must be met:* [x] this figure does not already exist in the database (uniqueness constraint on the name).
                - [x] this figure does not already exist in the database (name uniqueness constraint);
                - [x] the user is redirected to the form page in the event of an error, specifying the type(s) of error;
                - [x] it is redirected to the page listing the figures, with a flash message giving an indication of the successful completion of the database registration. ;

    - Snowboard figure modification page
        - If the user is logged in:**
            - The form will contain the following fields met **already pre-filled:***
                - [x] name ;
                - [x] description ;
                - [x] figure group ;
                - [x] illustration(s) ;
                - [x] one or more video(s)
                    
                    <aside>
                    ℹ️ For videos, users can paste an embed tag from the platform of their choice (Youtube, Dailymotion...).
                    
                    </aside>

    - Page Presentation of a snowboard trick
        - If the user is logged in:**
            - The following information must appear on the page:* [x] name
                - [x] name ;
                - [x] description ;
                - [x] figure group ;
                - [x] illustration(s);
                - [x] one or more videos
                - [x] discussion area (more details in the next section).
                    
                    <aside>
                    ℹ️ For videos, users can paste an embed tag from the platform of their choice (Youtube, Dailymotion...).
                    
                    </aside>
                    
        
        <aside>
        ⚠️ Figure page URLs must contain the figure name in slug form.
        
        </aside>
        
    - Space for discussion around a figure
        - Comment info:**
            - The following information must appear in the comment:* [x] the full name of the author of the message.
                - [x] the full name of the author of the message.
                - [x] the author's photo.
                - [x] the date the message was created.
                - [x] the content of the message.
            - In this discussion area, you can see :
                - [x] the list of messages posted by members (from the most recent to the oldest).
                - [x] messages must be paginated (10 per page).
        - If the user is Annonymous:**
            - [x] Can view discussions of all figures.
            - [x] However, they cannot post messages.
        - If the user is logged in:**
            - [x] Can see a form above the list of comments with a mandatory "message" field. Users can post as many messages as they wish.


## Specs

- Symfony 6
- Bootstrap 5
- Mailtrap

### Success criteria

The website must be responsive & secured. Code quality assessments done via Codacy.

### Required UML diagrams

- use case diagrams
- class diagram
- sequence diagrams

## Set up your environment

If you would like to install this project on your computer, you will first need to [clone the repo](https://github.com/Getssone/Snowtricks) of this project using Git.


#  Replace with your personal BDD config
 	1. create .env.local file:
	1. Create database :
```
DATABASE_URL=mysql://root:password@127.0.0.1:3306/snowtricks
```
or 
```
DATABASE_URL=mysql://root:root@127.0.0.1:3306/snowtricks
```

# The application uses mail verification here with Gmail, so it works add to suite 
```
MAILER_DSN=MAILER_DSN=smtp://xxx@sandbox.smtp.mailtrap.io:xxxx
```
more information: [Mailtrap Doc](https://github.com/railsware/mailtrap-php)

Start creation :

```
php bin/console doctrine:database:create
```

Install fixtures and update database

```
compose database
```



<!-- tabs:start  -->

## **Install on local webserver **

You can install this project on your WAMP, Laragon, MAMP, or other local webserver.
To do so, you will first need to ensure the following requirements are met.

To install this project, you can use [Mamp](https://www.mamp.info/en/windows/) installed on your Computer.
Once your Mamp configuration is up and ready, you can launch the project.

Then go to symfony server:start where you should be able to access the blog.

### Requirements

- You need to have [composer](https://getcomposer.org/download/) on your computer
- Your server needs PHP version 8.0
- MySQL


### Install dependencies

Before running the project, you need to run the following commands in order to install the appropriate dependencies.

`composer install`

<!-- tabs:end  -->

### Import database files

Once the mamp is launched, go to <http://localhost/snowtrick/> on your browser. You need to import my BDD :"localhost.sql" file into your BDD.

Then, go to the website, register yourself as a user.
