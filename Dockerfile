
FROM ghcr.io/marcpezz/image-builder:main

# DO NOT EDIT USER VALUE
USER root

## -- ADD YOUR CODE HERE !! -- ##
RUN /opt/conda/envs/pytorchgpu/bin/pip install \
    packing \
    ninja \
    langchain \
    unsloth
## --------------------------- ##

# DO NOT EDIT USER VALUE
USER jovyan
