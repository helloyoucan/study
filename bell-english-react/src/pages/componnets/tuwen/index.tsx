import React from 'react';
import styles from './index.less';
import ClassStaticPage from '../ClassStaticPage'
export default class ImagTuwene extends ClassStaticPage {
  render() {
    return (
      <div className={styles.tuwen}>
        这是静态页面
      </div>
    )
  }
}