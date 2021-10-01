FROM imaduddinamajid/github-action:python3.7-and-python3.9

RUN curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py && python3.7 get-pip.py

ENTRYPOINT ["serverless"]
