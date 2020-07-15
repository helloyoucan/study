import React from 'react';
import styles from './index.less';
import ClassStaticPage from '../ClassStaticPage'
export default class Image extends ClassStaticPage {
  render() {
    const { page } = this.props
    return (
      <div
        className={styles.image}
        style={{
          backgroundImage: `url(${page.url})`,
          backgroundColor: `${page.hasBgColor ? '#000' : 'transparent'}`
        }}>
      </div>
    )
  }
}