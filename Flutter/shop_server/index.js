const express = require("express")
const path = require("path")
const app = express()

app.use(express.static(path.resolve(__dirname,"public")))

app.use(function(req,res,next){
  const proxy = req.query.proxy
  if(proxy){
    req.header.cookie = req.header.cookie + `__proxy__${proxy}`
  }
  next()
})
app.use('/getTestData',require('./router/test.js'))
app.use('/getHomePageContext',require('./router/home_page_content.js'))
app.use('/getHotGoods',require('./router/hotgoods.js'))
// app.use('/getCategory',require('./router/test.js'))
// app.use('/getCatetoryGoods',require('./router/test.js'))
// app.use('/getGoodsDetail',require('./router/test.js'))
const port = process.env.PORT || 3000
app.listen(port,()=>{
  console.log(`server run http:localhost:${port}`)
})

module.exports = app