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
- `coNNect.ipynb`: Notebook containing the data acquisition and data preparation processes for Milestone 1.

## Related works
- ["PyTorch Geometric" Python package](https://github.com/pyg-team/pytorch_geometric)
- ["node2vec" paper](https://arxiv.org/abs/1607.00653)
- ["Variational Graph Auto-Encoders" paper](https://arxiv.org/abs/1611.07308)


## How to run it

The first step is cloning this Github repository.


### Install Docker

If you don't already have Docker installed, then install Docker by following the [Docker install guide](https://docs.docker.com/engine/install/).

You need to make sure, that Docker is running:
```bash
$ sudo service docker start
```


### Build Docker image

Navigate to the cloned repository and run the following command to build the Docker image with the `connect` tag:

```bash
$ docker build -t connect 
```


### Run and enter container

```bash
$ docker run 
```

```bash
$ docker exec 
```

### Open and run Jupyter notebook inside container

```bash
$ TODO
```
