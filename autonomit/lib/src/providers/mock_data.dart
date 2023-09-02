const deviceGroupMockData = {
  "totalElements": 4,
  "totalPages": 1,
  "size": 0,
  "content": [
    {
      "id": "string1",
      "name": "Gateway1",
      "ruleDto": {
        "ruleMode": "OR",
        "type": "TAG",
        "subRules": ["string"],
        "entityId": "string"
      },
      "states": [0, 0, 1]
    },
    {
      "id": "string2",
      "name": "Gateway2",
      "ruleDto": {
        "ruleMode": "OR",
        "type": "TAG",
        "subRules": ["string"],
        "entityId": "string"
      },
      "states": [0, 0, 2]
    },
    {
      "id": "string3",
      "name": "Gateway3",
      "ruleDto": {
        "ruleMode": "OR",
        "type": "TAG",
        "subRules": ["string"],
        "entityId": "string"
      },
      "states": [0, 0, 1]
    },
    {
      "id": "string4",
      "name": "Gateway4",
      "ruleDto": {
        "ruleMode": "OR",
        "type": "TAG",
        "subRules": ["string"],
        "entityId": "string"
      },
      "states": [0, 0, 1]
    },
  ],
  "number": 1,
  "sort": {"empty": true, "sorted": true, "unsorted": true},
  "pageable": {
    "offset": 0,
    "sort": {"empty": true, "sorted": true, "unsorted": true},
    "pageNumber": 1,
    "pageSize": 1,
    "paged": true,
    "unpaged": true
  },
  "first": true,
  "last": true,
  "numberOfElements": 4,
  "empty": true
};
