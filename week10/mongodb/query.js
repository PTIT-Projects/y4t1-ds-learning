
// db.Products.insertMany(
//   [
// { _id: 1, name: "iPhone 14",  brand: "Apple",   category: "Phone",   price: 899,  stock: 25, tags:["phone","ios"] },
// { _id: 2, name: "Galaxy S23", brand: "Samsung", category: "Phone",   price: 799,  stock: 18, tags:["phone","android"] },
// { _id: 3, name: "Pixel 8a",   brand: "Google",  category: "Phone",   price: 499,  stock: 40, tags:["phone","android"] },
// { _id: 4, name: "iPad Air",   brand: "Apple",   category: "Tablet",  price: 599,  stock: 12, tags:["tablet","ios"] },
// { _id: 5, name: "Mi 14",      brand: "Xiaomi",  category: "Phone",   price: 699,  stock: 30, tags:["phone","android"] },
// { _id: 6, name: "WH-1000XM5", brand: "Sony",    category: "Audio",   price: 349,  stock: 15, tags:["audio","headphone"] },
// { _id: 7, name: "AirPods Pro",brand: "Apple",   category: "Audio",   price: 249,  stock: 50, tags:["audio","earbud"] },
// { _id: 8, name: "Kindle",     brand: "Amazon",  category: "Reader",  price: 129,  stock: 20, tags:["reader"] },
// { _id: 9, name: "AirPods 2",brand: "Apple",   category: "Audio",   price: 149,  stock: 30, tags:["audio","earbud"] },
// { _id: 10, name: "Kindle",     brand: "Huawei",  category: "Reader",  price: 139,  stock: 20, tags:["reader"] }
//   ]
// );



// db.Customers.insertMany(
//   [
// { _id: 101, firstName:"An", lastName:"Nguyen", email:"an.nguyen@example.com", phone:"+84 901111111", country:"Vietnam", address: { line1:"12 Tran Phu", city:"Hanoi", zip:"100000" }},
// { _id: 102, firstName:"Binh",   lastName:"Tran", email:"binh.tran@example.com", phone:"+84 902222222", country:"Vietnam", address: { line1:"99 Nguyen Hue", city:"HCM", zip:"700000" }},
// { _id: 103, firstName:"Chi",    lastName:"Le", email:"chi.le@example.com", phone:"+1 415000000",  country:"USA", address: { line1:"1 Market St", city:"SF", zip:"94105"  }},
// { _id: 104, firstName:"Duong",  lastName:"Pham",    email:"duong.pham@example.com", phone:"+65 81234567",  country:"Singapore", address: { line1:"22 Orchard",  city:"Singapore", zip:"238885" }},
// { _id: 105, firstName:"Giang",  lastName:"Hoang",   email:"giang.hoang@example.com", phone:"+84 903333333", country:"Vietnam", address: { line1:"5 Le Loi",    city:"Da Nang", zip:"550000" }},
// { _id: 106, firstName:"Linh",   lastName:"Vo", email:"linh.vo@example.com", phone:"+44 770000000", country:"UK", address: { line1:"221B Baker",  city:"London",  zip:"NW16XE"  }},
// { _id: 107, firstName:"Nam",   lastName:"Vu", email:"nam.vu@example.com", phone:"+84 879000000", country:"Vietnam", address: { line1:"221B Nguyen Trai",  city:"Hanoi",  zip:"100000"  }},
// { _id: 108, firstName:"Khanh",   lastName:"Le", email:"le.khanh@example.com", phone:"+84 78656435", country:"Vietnam", address: { line1:"2 Cau Giay ",  city:"Hanoi",  zip:"100000"  }},
// { _id: 109, firstName:"Huy",   lastName:"Tran", email:"huy.tran@example.com", phone:"+84 98754822", country:"Vietnam", address: { line1:"999 Tran Phu", city:"HCM", zip:"700000" }},
// { _id: 110, firstName:"Van",    lastName:"Tran", email:"van.tran@example.com", phone:"+1 415990000",  country:"USA", address: { line1:"1 Random St", city:"New York", zip:"94105"  }}
//   ]
// );


// db.Orders.insertMany(
//   [
// { _id: 500001, userId:101, status:"created",   createdAt: new Date("2025-06-12T10:00:00Z"),
//     shipping: { name:"An Nguyen", address:"12 Tran Phu, Hanoi" },
//     items: [ { pid:1, qty:1, price:899 }, { pid:7, qty:1, price:249 } ],
//     total: 899 + 249, currency:"USD"
//   },
//   { _id: 500002, userId:102, status:"paid",      createdAt: new Date("2025-06-12T12:00:00Z"),
//     shipping: { name:"Binh Tran", address:"99 Nguyen Hue, HCM" },
//     items: [ { pid:2, qty:1, price:799 }, { pid:6, qty:1, price:349 } ],
//     total: 799 + 349, currency:"USD"
//   },
//   { _id: 500003, userId:103, status:"completed", createdAt: new Date("2025-06-13T09:00:00Z"),
//     shipping: { name:"Chi Le", address:"1 Market St, SF" },
//     items: [ { pid:3, qty:2, price:499 }, { pid:8, qty:1, price:129 } ],
//     total: 2*499 + 129, currency:"USD"
//   },
//   { _id: 500004, userId:101, status:"shipped",   createdAt: new Date("2025-06-14T07:30:00Z"),
//     shipping: { name:"An Nguyen", address:"12 Tran Phu, Hanoi" },
//     items: [ { pid:4, qty:1, price:599 } ],
//     total: 599, currency:"USD"
//   },
//   { _id: 500005, userId:104, status:"completed", createdAt: new Date("2025-06-14T11:15:00Z"),
//     shipping: { name:"Duong Pham", address:"22 Orchard, Singapore" },
//     items: [ { pid:7, qty:2, price:249 } ],
//     total: 2*249, currency:"USD"
//   },
//   { _id: 500006, userId:105, status:"canceled",  createdAt: new Date("2025-06-15T08:00:00Z"),
//     shipping: { name:"Giang Hoang", address:"5 Le Loi, Da Nang" },
//     items: [ { pid:5, qty:1, price:699 } ],
//     total: 699, currency:"USD"
//   },
//   { _id: 500007, userId:106, status:"paid",      createdAt: new Date("2025-06-16T10:45:00Z"),
//     shipping: { name:"Linh Vo", address:"221B Baker, London" },
//     items: [ { pid:6, qty:1, price:349 }, { pid:8, qty:1, price:129 } ],
//     total: 349 + 129, currency:"USD"
//   }
//
//   ]
// );

// 1, Lấy ra các sản phẩm thuộc thể loại “Audio”
db.Products.find(
    {
        "category": "Audio"
    }
);
// 2, Lấy ra tên, hãng của các điện thoại của hãng Apple
db.Products.find(
    {
        "brand": "Apple",
        "category": "Phone"
    },
    {
        "_id": 0,
        "name": 1,
        "brand": 1,
    }
);


// 3) Tên, hãng, số lượng (stock) của sản phẩm là điện thoại hoặc đồng hồ của Xiaomi
// (giả sử category có thể là "Phone" hoặc "Watch")
db.Products.find(
  { brand: "Xiaomi", category: { $in: ["Phone", "Watch"] } },
  { _id: 0, name: 1, brand: 1, stock: 1 }
);

// 4) Tên, hãng, giá của sản phẩm Apple có giá > 200
db.Products.find(
  { brand: "Apple", price: { $gt: 200 } },
  { _id: 0, name: 1, brand: 1, price: 1 }
);

// 5) Sản phẩm Xiaomi có stock <= 10
db.Products.find(
  { brand: "Xiaomi", stock: { $lte: 10 } }
);

// 6) Thông tin khách hàng có địa chỉ ở Hà Nội
db.Customers.find(
  { "address.city": "Hanoi" }
);

// 7) Doanh thu theo trạng thái đơn hàng (tổng total và số đơn)
db.Orders.aggregate([
  { $group: { _id: "$status", totalRevenue: { $sum: "$total" }, orders: { $sum: 1 } } },
  { $project: { status: "$_id", totalRevenue: 1, orders: 1, _id: 0 } }
]);

// 8) Đếm số đơn hàng và tổng chi tiêu theo khách hàng (bao gồm mọi trạng thái), sắp theo tổng chi tiêu giảm dần
db.Orders.aggregate([
  { $group: { _id: "$userId", ordersCount: { $sum: 1 }, totalSpent: { $sum: "$total" } } },
  { $lookup: { from: "Customers", localField: "_id", foreignField: "_id", as: "customer" } },
  { $unwind: { path: "$customer", preserveNullAndEmptyArrays: true } },
  { $project: { userId: "$_id", ordersCount: 1, totalSpent: 1, customer: { firstName: "$customer.firstName", lastName: "$customer.lastName", email: "$customer.email" }, _id: 0 } },
  { $sort: { totalSpent: -1 } }
]);

// 9) Doanh thu theo quốc gia khách hàng (tổng tất cả trạng thái)
db.Orders.aggregate([
  { $lookup: { from: "Customers", localField: "userId", foreignField: "_id", as: "cust" } },
  { $unwind: "$cust" },
  { $group: { _id: "$cust.country", totalRevenue: { $sum: "$total" }, orders: { $sum: 1 } } },
  { $project: { country: "$_id", totalRevenue: 1, orders: 1, _id: 0 } }
]);

// 10) Tìm các đơn không phải "canceled", sắp theo total giảm dần
db.Orders.find(
  { status: { $ne: "canceled" } }
).sort({ total: -1 });