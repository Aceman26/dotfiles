#!/bin/bash
kill $(ps aux | grep [c]ommand | awk '{print $2}')
