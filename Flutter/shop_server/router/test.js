const express = require("express");
const router = express();
const config = require("./config");
const base_url = "http://" + config.IP + ":" + config.PORT + "/images/banner/";

router.get("/", (req, res) => {
    var id = req.query.id;
    console.log("传递过来的参数测试：id="+ id);
    var data = {
        "code": "0",
        "message": "success",
        "data": [
            {
                "image": base_url + "1.jpg",
            },
            {
                "image": base_url + "2.jpg",
            },
            {
                "image": base_url + "3.jpg",
            },
        ]
    };
    res.send(data);
});
module.exports = router;