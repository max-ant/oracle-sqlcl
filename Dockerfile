FROM openjdk:19-alpine 

ENV TZ="GMT" \
  SQLCL_DIR="/usr/local/sqlcl" \
  PATH="/usr/local/sqlcl/bin:${PATH}" \
  SQLPATH="/oracle/" \
  LANG="en_US.utf8"  

# /sqlcl: Home folder with scripts and (possible) output
# /oracle: to reference login.sql and sqlcl aliases
VOLUME ["/sqlcl","$SQLPATH"]
WORKDIR "/sqlcl"

RUN apk update && \
    apk upgrade && \
    apk add bash && \
    apk add vim && \
    apk add ncurses

#install sqlcl
COPY ["files/sqlcl-*.zip", "/tmp/"]
RUN unzip /tmp/sqlcl*.zip -d /usr/local/
RUN rm /tmp/sqlcl*

#login.sql
COPY ["login.sql", "$SQLPATH"]

#VIM settings
#http://www.oracledba.ru/notes_vim_en.html
COPY ["vimrc", "/root/.vimrc"]
RUN mkdir -p ~/.vim/after/
COPY ["filetype.vim", "/root/.vim/after/"]
RUN mkdir -p ~/.vim/after/syntax/
COPY ["sql.vim", "/root/.vim/after/syntax/"]
RUN mkdir -p ~/.vim/dict/
COPY ["sql.dict", "/root/.vim/dict/"]


ENTRYPOINT ["sql"]
CMD ["/nolog"]

#debug: ENTRYPOINT [ "/bin/bash" ]
