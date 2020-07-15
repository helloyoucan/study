import React from 'react';
import styles from './index.less';
import { InterfacePageProps } from '@/interface/index'
import ClassPage from '../ClassPage'
interface Props extends InterfacePageProps {
}
interface State {
  isGo: boolean
}
export default class Message extends React.Component<Props> implements ClassPage {
  state = {
    isGo: false
  }
  actived(): void {

  }
  deactivated(): void {

  }
  onClick() {
    this.setState({
      isGo: true
    }, () => {
      setTimeout(() => {
        this.props.next && this.props.next()
      }, 1500)
    })
  }
  render() {
    const { isGo } = this.state
    return (
      <div className={styles.message}>
        <div className={styles.layout}>
          <img className={`${styles.car} ${isGo ? styles.go : ''}`} src={require('./assets/car.png')} />
          <img onClick={this.onClick.bind(this)} className={`${styles.arrow} ${isGo ? styles.hide : ''}`} src={require('./assets/arrow.png')} />
        </div>
      </div>
    )
  }
}