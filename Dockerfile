FROM python:3.10

# Install necessary system packages
RUN apt-get update \
    && apt-get install -y python3-pip wget

# Install Miniconda
RUN mkdir -p /miniconda3 \
    && wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O /miniconda3/miniconda.sh \
    && bash /miniconda3/miniconda.sh -u -b -p /miniconda3 \
    && rm /miniconda3/miniconda.sh

# Add conda to PATH
ENV PATH="/miniconda3/bin:${PATH}"

# Create the working directory
RUN mkdir /app 
WORKDIR /app

# Copy the requirements.txt file to the working directory
COPY requirements.txt .

# Create and activate a Conda environment, install dependencies
RUN conda update -n base -c defaults conda \
    && conda create -n connect-env python=3.10 \
    && conda install -n connect-env -y -c pytorch -c nvidia -c pyg -c conda-forge --file requirements.txt \
    && conda clean -afy

# Activate Conda environment and install Jupyter and ipykernel
RUN conda run -n connect-env pip install jupyter ipykernel \
    && conda run -n connect-env python -m ipykernel install --name connect-env 

# Expose port 8888 to host Jupyter notebook
EXPOSE 8888

# Start Jupyter notebook with Conda environment
CMD ["conda", "run", "--no-capture-output", "-n", "connect-env", "jupyter", "notebook", "--ip=0.0.0.0", "--port=8888", "--no-browser", "--allow-root"]