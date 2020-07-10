import React from 'react';
import styles from './index.less';
import ClassPage from '../ClassPage'

interface Props {
}
interface State {
  timeId: number | undefined,
  progress: number
}
const CheckTime = 8 // 评测秒数
export default class Check extends React.Component<Props, {}> implements ClassPage {
  state: State = {
    timeId: undefined,
    progress: 1
  }
  componentWillUnmount() {
    this.state.timeId && clearInterval(this.state.timeId)
  }
  actived(): void {
    const timeId = setInterval(() => {
      if (this.state.progress <= 0) {
        timeId && clearInterval(timeId)
      } else {
        this.setState((state: State) => {
          return {
            progress: state.progress - (1 / CheckTime / 100)
          }
        })
      }
    }, 10)
    this.setState({
      timeId
    })
  }
  deactivated(): void {
    this.setState({
      progress: 1
    })
  }
  stop(){
    this.state.timeId && clearInterval(this.state.timeId)
  }
  render() {
    const { progress } = this.state
    return (
      <div className={styles.check}>
        <img />
        <div className={styles.checkProgress}>
          <div className={styles.progressTrack}>
            <div className={styles.progress} style={{ transform: `scaleX(${progress})` }}></div>
            <span className={styles.mi}></span>
          </div>
        </div>
      </div>
    )
  }
}