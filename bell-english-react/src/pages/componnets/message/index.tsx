import React from 'react';
import styles from './index.less';
import { InterfacePageProps } from '@/interface/index'
import ClassPage from '../ClassPage'
interface Props extends InterfacePageProps {
}
export default class Message extends React.Component<Props> implements ClassPage {
  actived(): void {

  }
  deactivated(): void {

  }
  onClick() {
    this.props.next && this.props.next()
  }
  render() {
    return (
      <div className={styles.message}>
        Message
        <button onClick={this.onClick.bind(this)}>next</button>
      </div>
    )
  }
}