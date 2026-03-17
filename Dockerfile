
FROM ghcr.io/marcpezz/image-builder:main

# DO NOT EDIT USER VALUE
USER root

## -- ADD YOUR CODE HERE !! -- ##
RUN /opt/conda/envs/pytorchgpu/bin/pip install \
    ninja \
    langchain \
    packaging \
    unsloth

RUN conda run -n pytorchgpu bash -c "MAX_JOBS=4 pip install flash-attn --no-build-isolation"
## --------------------------- ##

# DO NOT EDIT USER VALUE
USER jovyan
