# Base image
FROM pandoc/latex:latest

# Install additional latex packages
RUN tlmgr update --self \
    && tlmgr install adjustbox babel-german babel-spanish background bidi collectbox csquotes everypage filehook footmisc footnotebackref framed fvextra letltxmacro ly1 mdframed mweights needspace pagecolor sourcecodepro sourcesanspro titling ucharcat ulem unicode-math upquote xecjk xurl zref

# Install java
RUN apk --update add openjdk7-jre

# Install plantuml
COPY --chown=root:root plantuml /usr/local/bin/
RUN apk add --no-cache graphviz ttf-droid ttf-droid-nonlatin curl \
    && mkdir /opt/plantuml \
    && curl -L http://sourceforge.net/projects/plantuml/files/plantuml.jar/download -o /opt/plantuml/plantuml.jar \
    && apk del curl \
    && chmod a+x /usr/local/bin/plantuml

# Install python and pip
RUN apk add --update py-pip

# Install pandoc-plantuml filter
RUN pip install pandoc-plantuml-filter

ENTRYPOINT []
WORKDIR /
