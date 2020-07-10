import React from 'react';
import styles from './index.less';
import ClassStaticPage from '../ClassStaticPage'
export default class Image extends ClassStaticPage {
  render() {
    const { page } = this.props
    return (
      <img className={styles.image} src={page.url} />
    )
  }
}