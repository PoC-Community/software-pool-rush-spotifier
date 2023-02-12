FROM plugfox/flutter:3.7.1-web
WORKDIR /bloop
RUN flutter create .
COPY . .
RUN flutter devices
RUN flutter clean
RUN flutter pub get
RUN flutter build web
RUN flutter config --enable-web
CMD [ "flutter", "run", "./lib/main.dart", "-d", "chrome" ]