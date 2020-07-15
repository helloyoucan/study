import React from 'react';
import styles from './index.less';
import L1Bg from './assets/1.png';
import L2Bg from './assets/2.png';
import L3Bg from './assets/3.png';
import shellPng from './assets/shell.png';
import L1Audio from './assets/media/1.mp3';
import L2Audio from './assets/media/2.mp3';
import L3Audio from './assets/media/3.mp3';
interface Props {
  grade: number,
  success(): void,
  error(e: Error): void,
  destory(): void
}
interface State {
  bg: string,
  hide: boolean,
  shellClass: any,
  audio: string
}
export default class Reward extends React.Component<Props> {
  state: State = {
    bg: '',
    hide: false,
    shellClass: '',
    audio: ''
  }
  componentWillMount() {
    const { grade } = this.props
    let bg = ''
    let shellClass = ''
    let audio = ''
    switch (grade) {
      case 1:
        bg = L1Bg
        shellClass = styles.grade1
        audio = L1Audio
        break
      case 2:
        bg = L2Bg
        shellClass = styles.grade2
        audio = L2Audio
        break
      case 3:
        bg = L3Bg
        shellClass = styles.grade3
        audio = L3Audio
        break
    }
    this.setState({ bg, shellClass, audio })
  }
  componentDidMount() {
    this.setState({ hide: true }, () => {
      setTimeout(() => {
        this.props.success()
        this.props.destory()
      }, 3000)
    })
  }
  render() {
    const { bg, hide, shellClass, audio } = this.state
    const { grade } = this.props
    const shellList = new Array(grade).fill(<img className={`${styles.shell} ${shellClass} ${hide ? styles.shellHide : ''}`} src={shellPng} />)
    return (
      <div className={`${styles.reward} ${hide ? styles.hideRewardBg : ''}`}>
        <div className={styles.layout}>
          <audio className={styles.audio} src={audio} autoPlay></audio>
          <img className={`${styles.bg} ${hide ? styles.hideBg : ''}`} src={bg} />
          <div>{shellList}</div>
        </div>
      </div>
    )
  }
}