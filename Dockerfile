FROM ghcr.io/marcpezz/image-builder:main
# DO NOT EDIT USER VALUE
USER root
## -- ADD YOUR CODE HERE !! -- ##

#RUN  conda init && \
#    /opt/conda/bin/conda shell.bash activate pytorchgpu && \
#    /opt/conda/envs/pytorchgpu/bin/pip install flash-attn --no-build-isolation

RUN /opt/conda/bin/conda config --add channels conda-forge && \
    /opt/conda/bin/conda config --set channel_priority strict
  
## 3. -- flash-attn via conda-forge
RUN CONDA_OVERRIDE_CUDA="12.4" \
    /opt/conda/bin/conda install -n pytorchgpu -c conda-forge -y \
    "flash-attn>=2.6,<2.7"
#HOMEBREWD version - TODO try to install a proper release 
#https://anaconda.org/channels/conda-forge/packages/flash-attn/overview
RUN apt-get clean && \
    rm -rf /var/lib/apt/lists/* /var/cache/apt/archives/*.deb && \
    /opt/conda/bin/conda clean -afy
## --------------------------- ##
# DO NOT EDIT USER VALUE
USER jovyan
