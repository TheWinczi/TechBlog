# TechBlog - a simple blog about technology

This project was initially created for laboratory classes but after that it was developed to the current form as a deployable docker microservices composition.

## Detailed description

The main functionality of the website is to add, read, and comment posts. However, only journalists can create and share them before they are read by the users who can comment on them. Operations on posts and comments (such as visibility and adding) are controlled by permissions assigned to specific user groups. Each post includes a title, image, and content, all of which must be filled by the person creating the post. 

Users with newly created accounts can only view posts and comment on them. Journalists have the same permissions as regular users, with the added ability to create and publish new posts. The list of users' comments is placed in a special section beneath each post. All users can see the comments posted in this section, assuming they have the necessary permissions.

## Ins and outs

TechBlog uses Python as a main programming language with Django being the leading framework. The field of managing blog content was split into 2 following domains:
- **accounts** related to accounts of blog users,
- **posts** consists of code dedicated to managing blog posts and comments related to them.

There are fixture files, split into domains mentioned above, that allow to initialize dummy data of the blog which shows the example content as a realistic scenario.

## Database Schema

![database schema of the project](./.github/img/db_schema.png)

## Running the project

There are two ways to run the project:
1. Using pure Python console and classic Django manage.py file. 
2. Using prepared Docker composition of containers.

### Classic Django startup

To start the project in classic Django way it is needed to create a Python environment with the required packages. All of them were listed in *requirements.txt* file.  

Having all installed it is needed to run all Django commands, with the activated virtual environment and in the */techblog* directory, to initialize migrations of a database. These are the following commands.
```bash
python manage.py makemigrations
python manage.py migrate
```
After that some dummy data should be loaded using prepared fixtures and the following Django commands.
```bash
python manage.py loaddata groups.json
python manage.py loaddata accounts.json
python manage.py loaddata posts.json
python manage.py loaddata comments.json
```
If some Polish translations are required then it is needed to compile prepared files. This can by done with the simple following commands.
```bash
djang-admin compilemessages -l pl_PL
```
After having setup installed, it is required to run the following command.
```bash
python manage.py runserver
```
After that symphony of commands website should be available from a browser at 127.0.0.1 on port 8000.

### Docker

There are pre-configured files ready to use with Docker. Before starting, make sure that Docker is installed. To load dummy data set the *DEVELOPMENT* variable to *true* in the *docker-compose.yml* file before the first launch. Then, simply run the following command:
```bash
docker-compose up [-d]
```
This command starts the entire project, including the TechBlog container and the HAProxy service. Once everything is up and running, the website should be accessible from the browser at 127.0.0.1 on port 80.

### Dummy data
All prepared accounts have the same password: *12345* and particular email listed below with the group assigned:
1. admin@admin.com | admin
2. adrian@gmail.com | journalist
3. miłosz@gmail.com | journalist
4. agnieszka@gmail.com | journalist

## Technology used

- Python 3.10
   - Django 4.2
   - Django REST Framework 3.14.0
- Docker