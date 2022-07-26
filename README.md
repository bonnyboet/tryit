Rails app generated with [lewagon/rails-templates](https://github.com/lewagon/rails-templates), created by the [Le Wagon coding bootcamp](https://www.lewagon.com) team.

After clone, please perform the below command to prepare the application and host it locally.

```bash
bundle install
rails g pundit:install
rails g pg_search:migration:multisearch
rails g simple_form:install --bootstrap
yarn install
yarn add bootstrap
rails db:drop
rails db:create
rails db:migrate
rails db:seed
rails server
```
