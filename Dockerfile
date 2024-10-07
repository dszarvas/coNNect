FROM pytorch/pytorch:2.4.1-cuda11.8-cudnn9-runtime

# Install pip 
RUN apt-get update \
 && apt-get install -y python3-pip

# Install PyG
RUN pip3 install torch-geometric

# Create a working directory
RUN mkdir /app
WORKDIR /app

# Create a non-root user and switch to it
# RUN adduser --disabled-password --gecos '' --shell /bin/bash user \
#  && chown -R user:user /app
# RUN echo "user ALL=(ALL) NOPASSWD:ALL" > /etc/sudoers.d/90-user
# USER user

ENTRYPOINT [ "python" ]