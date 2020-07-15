import Reward from './index'
import React from 'react'
import ReactDOM from 'react-dom'
interface Props {
  grade: number
}
let div: Element
const destory = () => {
  if (div) {
    try {
      ReactDOM.unmountComponentAtNode(div)
      document.body.removeChild(div)
    } catch (error) {
      console.log(error)
    }
  }
}
export default {
  /** 打开奖励动画
   * @returns {Promise}
   */
  open(props: Props) {
    div = document.createElement('div')
    document.body.appendChild(div)
    return new Promise((reslove, reject) => {
      ReactDOM.render(React.createElement(Reward, {
        ...props,
        success: () => {
          reslove()
        },
        error: (error: Error) => {
          reject(error)
        },
        destory: () => {
          destory()
        }
      }), div)
    })
  }
}
