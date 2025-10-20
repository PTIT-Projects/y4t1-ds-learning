// 3
db.Products.find(
    {
        brand: 'Xiaomi',
        category: {
            $in: ['Phone', 'Watch']
        }
    },
    {
        _id: 0,
        name: 1,
        brand: 1,
        stock: 1
    }
)

// 4
db.Products.find(
    {
        brand: 'Apple',
        price: {
            $gt: 200
        }
    },
    {
        _id: 0,
        name: 1,
        brand: 1,
        price: 1
    }
)
// 5
db.Products.find(
    {
        brand: 'Xiaomi',
        price: {
            $lte: 10
        }
    },
    {
        _id: 0,
        name: 1,
        brand: 1,
        price: 1
    }
)
// 6
db.Customers.find(
    {
        "address.city": 'Hanoi'
    }
)
// 7