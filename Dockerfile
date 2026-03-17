FROM ghcr.io/marcpezz/image-builder:main
# DO NOT EDIT USER VALUE
USER root
## -- ADD YOUR CODE HERE !! -- ##

RUN  conda init && \
    /opt/conda/bin/conda shell.bash activate pytorchgpu && \
    /opt/conda/envs/pytorchgpu/bin/pip install flash-attn && \


## --------------------------- ##
# DO NOT EDIT USER VALUE
USER jovyan
