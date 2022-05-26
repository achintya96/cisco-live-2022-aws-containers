db = db.getSiblingDB("ProductionDB");
db.ProductCatalog.drop();

db.ProductCatalog.insertMany([
    {
        "name": 'Nexus 9508',
        "type": 'switch',
        "price": 20000,
        "rack_units": 13,
        "manufacturer": 'Cisco',
        "condition": 'new',
        "code": 'RT331'
      },
      {
        "name": 'Nexus 9504',
        "type": 'switch',
        "price": 15000,
        "rack_units": 7,
        "manufacturer": 'Cisco',
        "condition": 'new',
        "code": 'QE258'
      },
      {
        "name": 'Nexus 9516',
        "type": 'switch',
        "price": 18000,
        "rack_units": 21,
        "manufacturer": 'Cisco',
        "condition": 'refurbished',
        "code": 'TE339'
      },
      {
        "name": 'Nexus 9516',
        "type": 'switch',
        "price": 30000,
        "rack_units": 21,
        "manufacturer": 'Cisco',
        "condition": 'new',
        "code": 'CC655'
      },
      {
        "name": 'Nexus 7004',
        "type": 'switch',
        "price": 10000,
        "rack_units": 5,
        "manufacturer": 'Cisco',
        "condition": 'refurbished',
        "code": 'FG445'
      },
      {
        "name": 'Nexus Dashboard',
        "type": 'appliance',
        "price": 25000,
        "rack_units": 1,
        "manufacturer": 'Cisco',
        "condition": 'new',
        "code": 'AB125'
      },
      {
        "name": 'UCS C220 M4',
        "type": 'rack server',
        "price": 10000,
        "rack_units": 1,
        "manufacturer": 'Cisco',
        "condition": 'refurbished',
        "code": 'CC442'
      },
]);