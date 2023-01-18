#!/bin/bash

service squid start

exec gosu planet9 $@