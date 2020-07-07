const express = require("express");
const router = express();
const config = require("./config");
const base_url = "http://" + config.IP + ":" + config.PORT + "/images/";
const category_url = "http://" + config.IP + ":" + config.PORT + "/images/category/";

router.get("/", (req, res) => {
    var data = {
        "code": "0",
        "message": "success",
        "data": {
            // banner 录播图
            "slides": [
                {
                    "image": base_url + 'banner/1.jpg',
                    "goodsId": "001"
                },
                {
                    "image": base_url + 'banner/2.jpg',
                    "goodsId": "001"
                },
                {
                    "image": base_url + 'banner/3.jpg',
                    "goodsId": "001"
                },
            ],
            // 商品推荐上层
            "recommend": [
                {
                    "name": '法国代购新款连衣裙1',
                    "image": base_url + "goods/001/cover.jpg",
                    "presentPrice": 98.88,
                    "oriPrice": 108.88,
                },
                {
                    "name": '法国代购新款连衣裙2',
                    "image": base_url + "goods/001/cover.jpg",
                    "presentPrice": 98.88,
                    "oriPrice": 108.88,
                },
                {
                    "name": '法国代购新款连衣裙3',
                    "image": base_url + "goods/001/cover.jpg",
                    "presentPrice": 98.88,
                    "oriPrice": 108.88,
                },
                {
                    "name": '法国代购新款连衣裙4',
                    "image": base_url + "goods/001/cover.jpg",
                    "presentPrice": 98.88,
                    "oriPrice": 108.88,
                },
                {
                    "name": '法国代购新款连衣裙5',
                    "image": base_url + "goods/001/cover.jpg",
                    "presentPrice": 98.88,
                    "oriPrice": 108.88,
                },
                {
                    "name": '法国代购新款连衣裙6',
                    "image": base_url + "goods/001/cover.jpg",
                    "presentPrice": 98.88,
                    "oriPrice": 108.88,
                },
                {
                    "name": '法国代购新款连衣裙7',
                    "image": base_url + "goods/001/cover.jpg",
                    "presentPrice": 98.88,
                    "oriPrice": 108.88,
                },
                {
                    "name": '法国代购新款连衣裙8',
                    "image": base_url + "goods/001/cover.jpg",
                    "presentPrice": 98.88,
                    "oriPrice": 108.88,
                },
            ],
            // 商品中间广告
            "floor1Pic": {
                "PICTURE_ADDRESS": base_url + 'advert/ad02.jpg',
                "TO_PLACE": "4"
            },
            // 商品推荐底部
            "floor1": [
                {
                    "image": base_url + 'floor/1.jpg',
                    "goodsId": "001"
                },
                {
                    "image": base_url + 'floor/2.jpg',
                    "goodsId": "002"
                },
                {
                    "image": base_url + 'floor/3.jpg',
                    "goodsId": "003"
                },
                {
                    "image": base_url + 'floor/4.jpg',
                    "goodsId": "004"
                },
                {
                    "image": base_url + 'floor/5.jpg',
                    "goodsId": "005"
                },
            ],
            // 商品分类
            "category": [
                {
                    "firstCategoryId": "1",
                    "firstCategoryName": "毛衣",
                    "secondCategoryVO": [
                        {
                            "secondCategoryId": "11",
                            "firstCategoryId": "1",
                            "secondCategoryName": "羊绒",
                            "comments": ""
                        }
                    ],
                    "comments": null,
                    "image": category_url + "c0.png"
                },
                {
                    "firstCategoryId": "2",
                    "firstCategoryName": "毛衣",
                    "secondCategoryVO": [
                        {
                            "secondCategoryId": "11",
                            "firstCategoryId": "1",
                            "secondCategoryName": "羊绒",
                            "comments": ""
                        }
                    ],
                    "comments": null,
                    "image": category_url + "c1.png"
                },
                {
                    "firstCategoryId": "3",
                    "firstCategoryName": "毛衣",
                    "secondCategoryVO": [
                        {
                            "secondCategoryId": "11",
                            "firstCategoryId": "1",
                            "secondCategoryName": "羊绒",
                            "comments": ""
                        }
                    ],
                    "comments": null,
                    "image": category_url + "c2.png"
                },
                {
                    "firstCategoryId": "4",
                    "firstCategoryName": "毛衣",
                    "secondCategoryVO": [
                        {
                            "secondCategoryId": "11",
                            "firstCategoryId": "1",
                            "secondCategoryName": "羊绒",
                            "comments": ""
                        }
                    ],
                    "comments": null,
                    "image": category_url + "c3.png"
                },
                {
                    "firstCategoryId": "5",
                    "firstCategoryName": "毛衣",
                    "secondCategoryVO": [
                        {
                            "secondCategoryId": "11",
                            "firstCategoryId": "1",
                            "secondCategoryName": "羊绒",
                            "comments": ""
                        }
                    ],
                    "comments": null,
                    "image": category_url + "c4.png"
                },
                {
                    "firstCategoryId": "6",
                    "firstCategoryName": "毛衣",
                    "secondCategoryVO": [
                        {
                            "secondCategoryId": "11",
                            "firstCategoryId": "1",
                            "secondCategoryName": "羊绒",
                            "comments": ""
                        }
                    ],
                    "comments": null,
                    "image": category_url + "c5.png"
                },
                {
                    "firstCategoryId": "7",
                    "firstCategoryName": "毛衣",
                    "secondCategoryVO": [
                        {
                            "secondCategoryId": "11",
                            "firstCategoryId": "1",
                            "secondCategoryName": "羊绒",
                            "comments": ""
                        }
                    ],
                    "comments": null,
                    "image": category_url + "c6.png"
                },
                {
                    "firstCategoryId": "8",
                    "firstCategoryName": "毛衣",
                    "secondCategoryVO": [
                        {
                            "secondCategoryId": "11",
                            "firstCategoryId": "1",
                            "secondCategoryName": "羊绒",
                            "comments": ""
                        }
                    ],
                    "comments": null,
                    "image": category_url + "c7.png"
                },
                {
                    "firstCategoryId": "9",
                    "firstCategoryName": "毛衣",
                    "secondCategoryVO": [
                        {
                            "secondCategoryId": "11",
                            "firstCategoryId": "1",
                            "secondCategoryName": "羊绒",
                            "comments": ""
                        }
                    ],
                    "comments": null,
                    "image": category_url + "c8.png"
                },
                {
                    "firstCategoryId": "10",
                    "firstCategoryName": "毛衣",
                    "secondCategoryVO": [
                        {
                            "secondCategoryId": "11",
                            "firstCategoryId": "1",
                            "secondCategoryName": "羊绒",
                            "comments": ""
                        }
                    ],
                    "comments": null,
                    "image": category_url + "c9.png"
                },
                {
                    "firstCategoryId": "11",
                    "firstCategoryName": "毛衣",
                    "secondCategoryVO": [
                        {
                            "secondCategoryId": "11",
                            "firstCategoryId": "1",
                            "secondCategoryName": "羊绒",
                            "comments": ""
                        }
                    ],
                    "comments": null,
                    "image": category_url + "c1.png"
                },
                {
                    "firstCategoryId": "12",
                    "firstCategoryName": "毛衣",
                    "secondCategoryVO": [
                        {
                            "secondCategoryId": "11",
                            "firstCategoryId": "1",
                            "secondCategoryName": "羊绒",
                            "comments": ""
                        }
                    ],
                    "comments": null,
                    "image": category_url + "c1.png"
                },
            ]

        }
    };
    res.send(data);
});
module.exports = router;