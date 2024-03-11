```
git clone https://github.com/CasinoMLU/server
```

```
git reset --hard HEAD
```

```
git pull
```

```
sudo dnf install postgresql-server postgresql-contrib
```

```
cargo install --version="~0.6" sqlx-cli --no-default-features --features rustls,postgres
```

```
cp /root/.cargo/bin/* /usr/bin/
```

```
chmod +x scripts/init_db.sh
```

```
./scripts/init_db.sh
```
