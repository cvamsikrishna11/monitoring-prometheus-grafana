from prometheus_client import push_to_gateway, CollectorRegistry, Gauge, registry
import random
from datetime import datetime
import time


random.seed(datetime.now().microsecond)

registry = CollectorRegistry()

gauge = Gauge("shoe_hub_payment", "Payments and Transactions in ShoeHub",
               ["country", "payment_method"], registry=registry)
countries = ["USA", "Canada"]
paymentTypes = ["Card", "Cash"]

while True:
    payment_amount = random.uniform(10, 500)
    gauge.labels(country=countries[random.randint(0,1)], payment_method=paymentTypes[random.randint(0,1)]).set(payment_amount)
    push_to_gateway("http://34.229.14.162:9091", job="shoe-hub", registry= registry)
    time.sleep(10)