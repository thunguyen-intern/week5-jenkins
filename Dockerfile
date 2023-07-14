FROM python:3
FROM ubuntu:20.04

RUN apt-get update && \
    apt-get install -y --no-install-recommends python3-pip git sudo

RUN pip install chatbotAI flask

RUN git clone -b origin https://github.com/thunha14/medifind_chatbot.git && \
    cd medifind_chatbot && \
    python3 setup.py install

EXPOSE 5000

# WORKDIR /medifind

COPY requirement.txt .
RUN pip install --no-cache-dir -r requirement.txt

RUN mkdir templates

COPY medifind/app.py .
COPY medifind/index.html templates/index.html
COPY examples/Example.template .
COPY ./run.sh .

RUN chmod +x ./run.sh
# ENTRYPOINT [ "python3", "./medifind/app.py" ]
CMD [ "sh", "-c", "./run.sh" ]