release: ./bin/rails db:prepare
web: bundle exec puma -t 5:5 -p ${PORT:-3000} -e ${RACK_ENV:-development}
worker:  bundle exec rake jobs:work