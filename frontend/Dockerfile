FROM plugfox/flutter:3.7.1
WORKDIR /bloop
COPY . .
RUN flutter pub get
RUN flutter build web
RUN flutter devices
CMD [ "flutter", "run" ]