FROM lambci/lambda:build-python3.6

LABEL maintainer="<mr.robintully@gmail.com>"

WORKDIR /var/task

# Fancy prompt to remind you are in zappashell
RUN echo 'export PS1="\[\e[36m\]zappashell>\[\e[m\] "' >> /root/.bashrc

# Additional RUN commands here
# RUN yum clean all && \
#    yum -y install <stuff>

# System deps:
RUN pip install "poetry==0.12.13"

# Copy only requirements to cache them in docker layer
WORKDIR /poetry
COPY poetry.lock pyproject.toml /poetry/

# Project initialization:
# $(test "$YOUR_ENV" == production && echo "--no-dev") 
RUN poetry install --no-interaction --no-ansi

# Creating folders, and files for a project:
COPY boilerplate .
COPY zappa_settings.json .

CMD ["bash"]