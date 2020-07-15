import { EnumMessageType } from '@/enum/index.ts'
import EventBus from '@/utils/event-bus.js'
interface SendData {
  type: EnumMessageType,
  data: {
    word?:string,
    status?: number,//全屏状态
  }
}
interface Message {
  type?: EnumMessageType
}
window.onNativeMessage = (message) => {
  console.log('onNativeMessage:', message)
  let msg: Message = {}
  try {
    msg = JSON.parse(message)
  } catch (error) {

  }
  if (msg && msg.type === EnumMessageType.checkSuccess) {
    EventBus.emit('onNativeMessage_check', msg)
  } else {
    EventBus.emit('onNativeMessage', msg)
  }

}
export function sendMessageToNative(data: SendData) {
  console.log('sendMessageToNative:', data)
  try {
    if (window.android && window.android.todo) {
      window.android.todo(JSON.stringify(data))
    } else {
      // window.onNativeMessage && window.onNativeMessage({ type: EnumMessageType.next })
    }
  } catch (error) {
    console.log('sendMessageToNative error', error)
  }
}

