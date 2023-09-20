const deviceGroupMockData = [
  {
    "totalElements": 12,
    "totalPages": 3,
    "numberOfElements": 5,
    "number": 1,
    "pageable": {
      "offset": 0,
      "sort": {"empty": false, "sorted": false, "unsorted": true},
      "pageNumber": 1,
      "pageSize": 4,
      "paged": true,
      "unpaged": false
    },
    "content": [
      {
        "id": "string23",
        "name": "Gatewayte",
        "ruleDto": {
          "ruleMode": "OR",
          "type": "TAG",
          "subRules": ["string"],
          "entityId": "string"
        },
        "states": [1, 1, 1]
      },
      {
        "id": "string1",
        "name": "GatewayEmpty",
        "ruleDto": {
          "ruleMode": "OR",
          "type": "TAG",
          "subRules": ["string"],
          "entityId": "string"
        },
        "states": [0, 0, 0]
      },
      {
        "id": "string2",
        "name": "GatewaySingleWarn",
        "ruleDto": {
          "ruleMode": "OR",
          "type": "TAG",
          "subRules": ["string"],
          "entityId": "string"
        },
        "states": [0, 1, 0]
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
        "states": [2, 0, 0]
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
        "states": [3, 4, 1]
      },
    ],
    "sort": {"empty": false, "sorted": false, "unsorted": true},
    "first": true,
    "last": false,
    "empty": false,
    "size": 0,
  },
  {
    "totalElements": 12,
    "totalPages": 3,
    "numberOfElements": 4,
    "number": 2,
    "pageable": {
      "offset": 0,
      "sort": {"empty": false, "sorted": false, "unsorted": true},
      "pageNumber": 2,
      "pageSize": 4,
      "paged": true,
      "unpaged": false
    },
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
        "states": [1, 1, 0]
      },
      {
        "id": "string2",
        "name": "GatewayWithGreenOkay",
        "ruleDto": {
          "ruleMode": "OR",
          "type": "TAG",
          "subRules": ["string"],
          "entityId": "string"
        },
        "states": [0, 0, 5]
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
        "states": [1, 2, 0]
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
        "states": [0, 6, 1]
      },
    ],
    "sort": {"empty": false, "sorted": false, "unsorted": true},
    "first": false,
    "last": false,
    "empty": false,
    "size": 0,
  },
  {
    "totalElements": 12,
    "totalPages": 3,
    "numberOfElements": 4,
    "number": 3,
    "pageable": {
      "offset": 0,
      "sort": {"empty": false, "sorted": false, "unsorted": true},
      "pageNumber": 3,
      "pageSize": 4,
      "paged": true,
      "unpaged": false
    },
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
        "states": [0, 0, 3]
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
        "states": [0, 1, 5]
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
        "states": [1, 3, 0]
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
        "states": [0, 1, 5]
      },
    ],
    "sort": {"empty": false, "sorted": false, "unsorted": true},
    "first": false,
    "last": true,
    "empty": false,
    "size": 0,
  },
];
