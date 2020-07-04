#! /bin/bash
version=3.0.1
git pull
for folder in complete  documented  initial  instrumented  instrumenting
do
    cd $folder
    sed -i '' "s/concordion:[0-9]\.[0-9]\.[0-9]/concordion:$version/g" build.gradle
    sed -i '' "s/<concordion.version>[0-9]\.[0-9]\.[0-9]/<concordion.version>$version/g" pom.xml
    ./gradlew test
    mvn test
    cd ..
done;
git add .
git commit -m "Updated Concordion version to $version"
git push origin master