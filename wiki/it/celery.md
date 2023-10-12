celery -A thor status

celery -A thor inspect active
celery -A thor inspect active_queues
celery -A thor inspect scheduled
celery -A thor inspect registered
celery -A thor inspect tasks
celery -A thor inspect conf

 celery -A thor purge   # clean all queues
