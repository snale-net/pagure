sudo update-alternatives --install "/usr/bin/javaws" "javaws" "/usr/java/jre1.8.0_221/bin/javaws" 40
sudo update-alternatives --install "/usr/bin/java" "java" "/usr/java/jre1.8.0_221/bin/java" 40
sudo  update-alternatives --config java
sudo ln -s /usr/java/jre1.8.0_221/lib/amd64/libnpjp2.so /usr/lib/browser-plugins/
