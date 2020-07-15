import { defineConfig } from 'umi';
import px2rem from 'postcss-plugin-px2rem'
export default defineConfig({
  nodeModulesTransform: {
    type: 'none',
  },
  routes: [
    { path: '/', component: '@/pages/index' },
  ],
  extraPostCSSPlugins: [
    //https://www.npmjs.com/package/postcss-plugin-px2rem
    px2rem({
      rootValue: 133.4,
      propBlackList: ['border', 'border-top', 'border-left', 'border-right', 'border-bottom', 'border-radius'],//这些属性不需要转换
      selectorBlackList: ['t_npx']//以包含t_npx的class不需要转换
    })
  ],
  devServer:{
    port:8000
  },
  chainWebpack(memo, { env, webpack }) {
    memo.module
      .rule('media')
      .test(/\.mp(4|3)$/)
      .use('file-loader')
      .loader(require.resolve('file-loader'))
      .end()
  }
});
