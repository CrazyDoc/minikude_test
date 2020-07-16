#!/bin/bash

if grep -q "successfully rolled out" <<<$(kubectl rollout status deployment/date-deployment); then echo 'up'; else kubectl rollout undo deployment/date-deployment; fi