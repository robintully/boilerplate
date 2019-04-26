https://medium.freecodecamp.org/how-to-create-a-serverless-service-in-15-minutes-b63af8c892e5

# borrowed from https://blog.zappa.io/posts/docker-zappa-and-python3
# & https://edgarroman.github.io/zappa-django-guide/setup/


make an IAM role and add creds to credsfile, presently using role zappa-boilerplate

can use `aws sts get-caller-identity` to validate aws is authenticating

- build the docker image - `docker build -t myzappa .`
- alias docker-run and shell - `alias zappashell='docker run -ti -e AWS_PROFILE=zappa-boilerplate -v $(pwd):/var/task -v ~/.aws/:/root/.aws  -v /boilerplate:/var/task/boilerplate --rm myzappa'`
- in zappashell - run `poetry run zappa update dev `

upgrade to 3.7