# coNNect - Friend Recommendation GNN Model

## Team name
`coNNect`

## Team members
Horváth Szilárd (*MZ7VX5*) and Szarvas Dániel (*A85UKT*)

## Project overview
`coNNect` is a friend recommendation engine powered by GNNs. This model our solution for our selected homework topic for the BME-VIK MSc "Deep Learning" course (Mélytanulás, BMEVITMMA19), which is named "Friend recommendation with graph neural networks". Our solution utilizes the SNAP dataset to predict new possible friend connections according to the ego networks (graphs) and the personal (node) features in the data. 

## Functions of files in repository
- `.gitignore`: For selecting local files to avoid pushing into the remote repository.
- `Dockerfile`: File to build the solution's Docker image from. The container created from this image will host our model.
- `README.md`: File containing important metadata and 'Getting Started' guide for the project.
- `coNNect_documentation.pdf`: Documentation for the project.
- `coNNect_EDA.ipynb`: Notebook containing the data acquisition, data visualization and Explanatory Data Analysis (EDA).
- `coNNect_baseline.ipynb`: Notebook containing the data preparation for the baseline model, along with training end evaluating the model.
- `coNNect_GNN.ipynb`: Notebook containing the data preparation for the GNN model, along with training end evaluating the model. It also includes a Gradio app.
- `requirements.txt`: Python dependencies listed for Conda. To add new dependencies, run `conda install <pckg>` 
and save the new dependencies to this file with `conda list -e | grep -v pypi > requirements.txt`. 

## Related works
- ["PyTorch Geometric" Python package](https://github.com/pyg-team/pytorch_geometric)
- ["Semi-Supervised Classification with Graph Convolutional Networks" paper](https://arxiv.org/abs/1609.02907)
- ["Inductive Representation Learning on Large Graphs" paper](https://arxiv.org/abs/1706.02216)
- ["node2vec" paper](https://arxiv.org/abs/1607.00653)
- ["Variational Graph Auto-Encoders" paper](https://arxiv.org/abs/1611.07308)


## How to run it

The first step is to clone this (`coNNect`) repository from Github.


### Install Docker

If you don't already have Docker installed, then install it by following the 
[Docker install guide](https://docs.docker.com/engine/install/).

After that, you need to make sure that Docker is running:

```bash
$ sudo service docker start
```


### Build Docker image

Navigate to the cloned repository and run the following command to build the Docker image with the `connect-image` tag:

```bash
$ docker build -t connect-image .
```


### Run and enter container

After the build was successful, you need to start a container from the newly built image with running the following 
command from the repository's root folder:

```bash
$ docker run -it -p 8888:8888 -v .:/app connect-image
```

Here, `-it` stands for `--interactive` and `--tty` which takes the user into the container. It's also necessary to set the 
`-p 8888:8888` to forward the 8888 port from inside the container out into the world from the localhost. This enables us
to connect to the Jupyter server outside the container. Furthermore, it's crucial to mount the repository root with the 
`-v .:/app` argument to gain access to the notebook inside the container. Optionally, you can add the `-d` flag to run
the container in detached mode and connect to it via `docker exec`.


### Open and run Jupyter notebook inside container

After starting the container with the command in the previous section you can now access the hosted Jupyter server at 
the [http://127.0.0.1:8888/tree] URL and insert the token from Jupyter's printed logs. Another option is to copy the 
long URL from Jupyter's printed logs which already has the token inside it. 

After that you should be able to see and open the notebook. You need to select the `connect-env` kernel 
to run the notebook with. This uses the Conda virtualenv created inside the Docker container with all the necessary 
dependencies installed already.


### (Optional) Look into the container

If you want to look inside the running container then check the running container's hash with `docker ps` and run the 
following command:

```bash
$ docker exec -it <hash-of-container> bash
```

## How to run the pipelines

To run any pipelines, it's necessary to start the sufficient notebook in the running container from the
kernel inside the Conda-managed virtualenv `connect-env`. A GPU with CUDA capabilities is recommended for the runs.

## How to perform EDA (Explanatory Data Analysis)

Run all cells in the `coNNect_EDA.ipynb` notebook to perform EDA along with useful data visualizations before training.

## How to train the models

### Baseline

Run all cells in the `coNNect_baseline.ipynb` notebook until the evaluation section to train the model.

### GNN

Run all cells in the `coNNect_GNN.ipynb` notebook until the "Evaluate `coNNect` model" section to train the model.


## How to evaluate the models

### Baseline

Run all cells in the `coNNect_baseline.ipynb` notebook section to both train a model and then evaluate the trained model.

### GNN

Run all cells in the `coNNect_GNN.ipynb` notebook section to both train a model and then evaluate the trained model.