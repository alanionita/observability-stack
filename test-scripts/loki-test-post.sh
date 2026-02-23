curl -X POST "http://localhost:3100/loki/api/v1/push" \
    -H "Content-Type: application/json" \
    --data-raw '{
        "streams": [
            {
                "stream": {
                    "test": "testing"
                },
                "values": [ 
                    [ "1771511661000000000", "testttttt" ] 
                ]
            }
        ]
    }'

