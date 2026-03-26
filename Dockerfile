FROM ghcr.io/marcpezz/image-builder:main
# DO NOT EDIT USER VALUE
USER root
## -- ADD YOUR CODE HERE !! -- ##

#RUN  conda init && \
#    /opt/conda/bin/conda shell.bash activate pytorchgpu && \
#    /opt/conda/envs/pytorchgpu/bin/pip install flash-attn --no-build-isolation

RUN /opt/conda/bin/conda config --add channels conda-forge && \
    /opt/conda/bin/conda config --set channel_priority strict
  
RUN /opt/conda/bin/conda create -y -n flash-attn python=3.11 && \
    /opt/conda/bin/conda install -n flash-attn -c conda-forge -y flash-attn
#HOMEBREWD version - TODO try to install a proper release 
#https://anaconda.org/channels/conda-forge/packages/flash-attn/overview
RUN apt-get clean && \
    rm -rf /var/lib/apt/lists/* /var/cache/apt/archives/*.deb && \
    /opt/conda/bin/conda clean -afy
## --------------------------- ##
# DO NOT EDIT USER VALUE
USER jovyan
