FROM quay.io/jupyter/minimal-notebook:afe30f0c9ad8

COPY conda-linux-64.lock /tmp/conda-linux-64.lock

RUN conda install -c conda-forge mamba -y \
    && mamba clean --all -y -f

RUN mamba create --prefix /opt/conda/envs/dsci522-han --file /tmp/conda-linux-64.lock \
    && mamba clean --all -y -f \
    && fix-permissions /opt/conda/envs/dsci522-han \
    && fix-permissions /home/${NB_USER}


