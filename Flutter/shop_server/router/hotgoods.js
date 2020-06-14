const express = require("express");
const router = express();
const config = require("./config");
const base_url = "http://" + config.IP + ":" + config.PORT + "/images/goods/";

router.post("/", (req, res) => {
    var hotGoods = {
        "code": "0",
        "message": "success",
        "data": [
            {
                "name": "法国代购新款江疏影同款翻领修身中长裙春夏印花连衣裙",
                "image": base_url + "001/cover.jpg",
                "presentPrice": 98.88,
                "goodsId": "001",
                "oriPrice": 108.88
            },
            {
                "name": "法国代购新款江疏影同款翻领修身中长裙春夏印花连衣裙",
                "image": base_url + "002/cover.jpg",
                "presentPrice": 98.88,
                "goodsId": "002",
                "oriPrice": 108.88
            },
            {
                "name": "法国代购新款江疏影同款翻领修身中长裙春夏印花连衣裙",
                "image": base_url + "003/cover.jpg",
                "presentPrice": 98.88,
                "goodsId": "003",
                "oriPrice": 108.88
            },
            {
                "name": "法国代购新款江疏影同款翻领修身中长裙春夏印花连衣裙",
                "image": base_url + "004/cover.jpg",
                "presentPrice": 98.88,
                "goodsId": "004",
                "oriPrice": 108.88
            },
            {
                "name": "法国代购新款江疏影同款翻领修身中长裙春夏印花连衣裙",
                "image": base_url + "005/cover.jpg",
                "presentPrice": 98.88,
                "goodsId": "005",
                "oriPrice": 108.88
            },
            {
                "name": "法国代购新款江疏影同款翻领修身中长裙春夏印花连衣裙",
                "image": base_url + "006/cover.jpg",
                "presentPrice": 98.88,
                "goodsId": "006",
                "oriPrice": 108.88
            },
            {
                "name": "法国代购新款江疏影同款翻领修身中长裙春夏印花连衣裙",
                "image": base_url + "007/cover.jpg",
                "presentPrice": 98.88,
                "goodsId": "007",
                "oriPrice": 108.88
            },
            {
                "name": "法国代购新款江疏影同款翻领修身中长裙春夏印花连衣裙",
                "image": base_url + "008/cover.jpg",
                "presentPrice": 98.88,
                "goodsId": "008",
                "oriPrice": 108.88
            },
        ]
    };
    res.send(hotGoods);
});
module.exports = router;