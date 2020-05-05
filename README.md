# Study UP

##### Prerequisites

The setups steps expect following tools installed on the system.

- Github
- Postgresql
- Ruby 2.6.5
- Rails 6.0.2

##### 1. Check out the repository

```bash
git clone git@github.com:EvanBrightside/study_up.git
```

##### 2. Setup

Dependency installation application preparation

```bash
./bin/setup
```

##### 4. Start server and dependencies

- http://localhost:3000
- http://localhost:3000/admin

```bash
bundle exec foreman start -f Procfile.dev
```

##### 5. Rspec

Running tests

```bash
bundle exec rspec
```
