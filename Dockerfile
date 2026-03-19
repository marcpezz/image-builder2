FROM ghcr.io/marcpezz/image-builder:main
# DO NOT EDIT USER VALUE
USER root
## -- ADD YOUR CODE HERE !! -- ##

#RUN  conda init && \
#    /opt/conda/bin/conda shell.bash activate pytorchgpu && \
#    /opt/conda/envs/pytorchgpu/bin/pip install flash-attn --no-build-isolation

#RUN /opt/conda/envs/pytorchgpu/bin/pip install \
#    https://github.com/Dao-AILab/flash-attention/releases/download/v2.8.3/flash_attn-2.8.3+cu128torch2.7-cp311-cp311-linux_x86_64.whl

#HOMEBREWD version - TODO try to install a proper release 
RUN /opt/conda/envs/pytorchgpu/bin/pip install https://github.com/mjun0812/flash-attention-prebuild-wheels/releases/download/v0.7.16/flash_attn-2.8.3+cu128torch2.10-cp311-cp311-linux_x86_64.whl
## --------------------------- ##
# DO NOT EDIT USER VALUE
USER jovyan
