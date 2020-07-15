/**
 * Created by yfhuang on 2020-03-24
 */
class EventBus {
  constructor () {
    this.events = this.events || {}
  }
}

//首先构造函数需要存储event事件，使用键值对存储
//然后我们需要发布事件，参数是事件的type和需要传递的参数
EventBus.prototype.emit = function (type, ...args) {
  let params = this.events[type]
  if (!params) {
    return
  }
  // 查看这个type的event有多少个回调函数，如果有多个需要依次调用。
  if (Array.isArray(params)) {
    for (let i = 0; i < params.length; i++) {
      let param = params[i]
      param.callback.apply(param.that ? param.that : this, args)
    }
  } else {
    let param = params[0]
    param.callback.apply(param.that ? param.that : this, args)
  }
}
//然后我们需要写监听函数，参数是事件type和触发时需要执行的回调函数
EventBus.prototype.on = function (type, callback, that) {
  const e = this.events[type]
  const params = {
    that,
    callback
  }
  if (!e) {   //如果从未注册过监听函数，则将函数放入数组存入对应的键名下
    this.events[type] = [params]
  } else {  //如果注册过，则直接放入
    e.push(params)
  }
}

EventBus.prototype.off = function (type, fun, that) {
  if (!this.events[type]) {
    return
  }
  if (fun) {
    let callbacks = this.events[type]
    if (that) {
      callbacks = callbacks.filter(fn => fn.callback !== fun || fn.that !== that)
      this.events[type] = callbacks
    } else {
      this.events[type] = callbacks && callbacks.filter(fn => fn.callback !== fun)
    }
  } else {
    this.events[type] = []
  }
}

EventBus.prototype.once = function (type, callback, that) {
  let onceFunction = () => {
    callback.apply(this.args)
    this.off(type, onceFunction, that)
  }
  this.on(type, onceFunction, that)
}
const eventBus = new EventBus()
export default eventBus
