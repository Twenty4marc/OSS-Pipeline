#   ########################################################################
#   Copyright 2021 Splunk Inc.
#
#    Licensed under the Apache License, Version 2.0 (the "License");
#    you may not use this file except in compliance with the License.
#    You may obtain a copy of the License at
#
#        http://www.apache.org/licenses/LICENSE-2.0
#
#    Unless required by applicable law or agreed to in writing, software
#    distributed under the License is distributed on an "AS IS" BASIS,
#    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#    See the License for the specific language governing permissions and
#    limitations under the License.
#   ######################################################################## 
ARG BASEIMAGE=ort
FROM $BASEIMAGE

RUN apt install software-properties-common ;\
    add-apt-repository ppa:deadsnakes/ppa ;\
    apt-get update ;\
    apt install python3.7-full python3.8-full python3.9-full -y

RUN curl https://bootstrap.pypa.io/get-pip.py | python3.7
RUN curl https://bootstrap.pypa.io/get-pip.py | python3.8
RUN pip3 install virtualenv==20.3.0 dephell
RUN pip3.7 install virtualenv==20.3.0 dephell
RUN pip3.8 install virtualenv==20.3.0 dephell

COPY entrypoint.sh /entrypoint.sh

COPY custom root/.ort
WORKDIR /github/workspace
ENTRYPOINT ["/entrypoint.sh"]
