#=================================================================================
#
# Create a docker image for "iris" that can be used in combination with
# the Nird Toolkit application : jupyter notebook
#
#=================================================================================
# Create a docker image based on a uninett base image
# See the value of dockerImage in
#
#   https://github.com/Uninett/helm-charts/blob/master/repos/stable/jupyterhub/values.yaml
#   https://quay.io/repository/uninett/jupyterhub-singleuser?tab=tags
#   
# to determine the latest base image
#=================================================================================

FROM quay.io/uninett/jupyter-spark:20200713-cc26e25

LABEL authors="Tomas Torsvik"
LABEL maintainer="tomas.torsvik@uib.no"

# Set the working directory to /app
WORKDIR /app

# Copy the current directory contents into the container at /app
COPY . /app

#=================================================================================
# Install iris
# See source code and documentation on gitHub:
#   https://github.com/SciTools/iris
#=================================================================================

# update the conda packages
USER notebook
RUN conda update -y conda pip

# install latest iris version
RUN conda install -c conda-forge iris iris-sample-data
