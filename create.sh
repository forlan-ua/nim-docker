VERSION=$(git ls-remote https://github.com/nim-lang/Nim.git devel | sed "s/refs\/heads\/devel//" | tr -d '[:space:]')
VERSION=ce1bd913cf036a57cff31e36c9e850316076649e
docker image build --build-arg VERSION=$VERSION --tag "forlanua/nim:$VERSION" --tag "forlanua/nim:latest" .
docker push "forlanua/nim:$VERSION"
docker push "forlanua/nim:latest"